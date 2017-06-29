#########################################################################
# Author: Andrés Herrera Poyatos
# Date: April, 2017
# Genetic algorithms for QAP.
#########################################################################

from enum import Enum
from numba import int64, jit, jitclass
import numpy as np
import random
import copy
import math
from sortedcontainers import SortedListWithKey

from Heuristic import Heuristic
from Solution import *
from LocalSearch import *
from Greedy import *
from Aux import argsort

TypeLSGA = Enum('TypeLSGA', 'None All Random Best')

class HybridizationLSGA():
    """ Class with the information about the hybridization between a genetic algorithm and a local search."""

    def __init__(self, local_search = LSType['2optb'], itpls = 1, lsga = TypeLSGA['None'],
                 proportion = 0, max_evals = -1):
        # Type of the local search used.
        self.local_search = local_search
        # Iterations per each application of the local search.
        self.itpls = itpls
        # Proportion of the population which is improved each iteration in which the local search is applied.
        self.proportion = proportion
        # Type of hybridization between the genetic algorithm and the local search.
        # By default the GA does not use the local search (None). There are other 3 types:
        # 1. All : All the population is improved by the local search.
        # 2. Random: A random subset of the population is improved by the local search. 
        # 3. Best: The best solutions are improved by the local search.
        # In 2 and 3 the number of solutions improved is determined by proportion.
        self.lsga = lsga
        # Maximum number of evaluations used by the local search.
        # By default it is -1, that is, there is no maximum.
        self.max_evals = max_evals
        # Number of solutions improved by the local search. It is determined by proportion when
        # we know the population size.
        self.num_improved = -1

    def computeNumImproved(self, pop_size):
        self.num_improved = max(round(pop_size * self.proportion),1) if self.lsga != TypeLSGA['All'] else pop_size

class GeneticAlgorithm(Heuristic):
    """ Abstract class which represents a general genetic algorithm.
    A genetic algorithm is an heuristic which first build a population using
    other procedures and then repetively evolve the population using the genetic operatos.
    A genetic algorithm iteration consist in evolving the population, that is, selecting, crossing and
    mutating population solutions, which are called chromosomes. The new chromosomes obtained after
    these procedures are introduced to the population under some predefined criteria.
    """

    def __init__(self, problem, verbose = False, print_aux_info = False, pop_size = -1, crossover = CrossType['Position'],
                 hybrid_ls = HybridizationLSGA()):
        """ Initializes the genetic algorithm. First, the heuristic is initialized as usual.
        Afterwards the population size, the crossover type and the local search used are saved as attributes.
        """

        super().__init__(problem, verbose, print_aux_info)
        # Population size. By default it is -1, value that should be changed in the
        # subclasses init method.
        self.pop_size = pop_size
        # Crossover used by the algorithm. By default it is the position crossover.
        self.crossover = crossover
        # Information about the hybridization with the local search.
        self.hls = hybrid_ls
        self.hls.computeNumImproved(self.pop_size)

        # List with the population solutions.
        self.population = None
        # Array with the objective values of the population chromosomes.
        self.ovalues = None
        # Best solution obtained by the genetic algorithm.
        self.best_sol = None
        # Index of self.best_sol in self.population
        self.best_sol_arg = -1
        # Bool which tells whether the ovalues vector is being used or not.
        self.using_ovalues = True
        # Name of the auxiliar info saved to csv.
        self.aux_info_name = "Diversity"
        
        
    def initializePopulation(self, rand = True, h = None, sorted_list = False):
        """ Initializes the genetic algorithm population as random 
        solutions or using the heuristic h. If sorted_list is true, then
        the population is saved in a sorted list.
        """
        if not rand and h != None:
            self.population = h.generateSolutions(self.pop_size)
        else:
            self.population = [Solution(self.problem) for i in range(0, self.pop_size)]
        
        if sorted_list:
            self.population = SortedListWithKey([(x,False) for x in self.population],
                                                key=lambda pair: -pair[0].getObjectiveValue(),
                                                load=10)
            self.using_ovalues = False
        else:
            self.ovalues = np.fromiter(map(lambda x: x.getObjectiveValue(), self.population), dtype=np.int64)
            self.improved = np.zeros(self.pop_size, dtype=np.bool_)

        self.num_evaluations += self.pop_size
        self.updateBestSol()

    def tournamentSelection(self):
        """ Selects a chromosome of the population with a binary torunament.
        That is, two random solutions are selected and the best one is returned.
        """
        if self.using_ovalues:
            return numbaTournamentSelection(self.ovalues)
        else:
            # Selects two random solutions of the population.
            ran1 = random.randint(0, self.pop_size-1)
            ran2 = random.randint(0, self.pop_size-1)
            # Compares the two random solutions, and return the best
            return ran1 if self.population[ran1][0] >= self.population[ran2][0] else ran2 

    def cross(self, p1, p2):
        s1, s2, evals = p1.cross(p2, self.crossover)
        self.num_evaluations+=evals
        return s1, s2

    def initialComputations1(self):
        """Initial computations of the genetic algorithm. It must be extended in each specific algorithm."""
        # Initializes the number of local searches applied in the computation.
        self.num_ls = 0

    
    def iteration(self):
        """ An iteration of a genetic algorithm consists in evolving the population. 
        Afterwards, if local_search != LSType('None'), the best not already improved 
        solution is improved by the local search.
        """
        self.evolve()

        # If there is an hybridization with the local search and it's been itpls iterations
        # since the last time that it was applied then it is applied again.
        if self.hls.lsga != TypeLSGA['None'] and self.current_it % self.hls.itpls == self.hls.itpls-1:
            for i in range(0, self.hls.num_improved):
                if self.applyLocalSearch(self.hls.lsga == TypeLSGA['Random']):
                    self.num_ls += 1
                else:
                    break

        self.updateBestSol()

    def evolve(self):
        """ Evolves the population. It must be implemented in each genetic algorithm."""
        raise NotImplementedError

    def applyLocalSearch(self, rand = False):
        raise NotImplementedError

    def updateBestSol(self):
        raise NotImplementedError
        
    def diversity(self):
        return NotImplementedError

    def saveAuxCSV(self):
        self.aux_info.append(self.diversity())
        
class GGA(GeneticAlgorithm):
    """ Implementation of a Generational Genetic Algorithm (GGA).
    A GGA first build a population using random solutions.
    The evolution procedure consist in building a new generation, that is, a new population
    whose chromosomes are obtained from the current population by selecting (binary tournament)
    a fixed number of parents, crossing them (two children per pair of parents), mutating them
    when needed and adding a fixed number of solutions from the current population. The new 
    generation substitues the current population.
    """

    def __init__(self, problem, verbose = False, print_aux_info = False, pop_size = -1,
                 crossover = CrossType['Position'], hybrid_ls = HybridizationLSGA(),
                 mut_prob = 0.001, cross_prob = 0.7):
        """ Initializes the GGA. 
        The default population size is 50.
        """
        super().__init__(problem, verbose, print_aux_info, pop_size, crossover, hybrid_ls)
        # Chooses the population size. It is always an ever number (by default 50).
        self.pop_size = pop_size + pop_size % 2 if pop_size > 0 else 50
        # Mutation probability
        self.mut_prob = 0.001 if mut_prob < 0 else mut_prob
        # Cross probability
        self.cross_prob = 0.7 if cross_prob < 0 else cross_prob
        # Number of crossed pairs of parents per generation.
        self.crossed_pairs = int(0.5*self.cross_prob * self.pop_size)
        # Minimum number of mutations per solution
        self.num_mut = math.floor(self.pop_size*self.mut_prob)
        # Probability of the last mutation.
        self.prob_last_mut = self.pop_size*self.mut_prob - self.num_mut

    def initialComputations1(self):
        """ Initializes the population with random solutions."""
        super().initialComputations1()
        self.initializePopulation()
        
    def evolve(self):
        """
        Creates a new empty population and adds new solutions to it.
        In order to do so, it crossess crossed_pairs pairs of parents, which are chosen
        using the tournament selection. Then it mutates the obtained solutions with 
        probability mut_prob. Afterwards, it fills the new population with solutions of
        the previous population, selected with the tournament selection. These solutions 
        are mutated analogously.
        If the best solution of the previous population, call it s, is in the new one, 
        then stop. Otherwise, find the worst solution of the new population, delete it 
        and add s to the new population. This step is called elitism.
        """
        new_population = [None]*self.pop_size
        new_improved = np.zeros(self.pop_size, dtype=np.bool_)
        apply_elitism = True

        # Computes the children.
        for i in range(0, self.crossed_pairs):
            # Selects the parents.
            p1 = self.tournamentSelection()
            p2 = self.tournamentSelection()

            # Crosses the parents.
            h1, h2 = self.cross(self.population[p1], self.population[p2])

            # Mutates the children.
            h1.mutate(self.num_mut)
            h2.mutate(self.num_mut)
            if random.random() <= self.prob_last_mut:
                h1.mutate()
            if random.random() <= self.prob_last_mut:
                h2.mutate()

            # Adds the new children to the new population.
            new_population[2*i] = h1
            new_population[2*i+1] = h2

            # If they are copies tell so.
            if h1 == self.best_sol:
                apply_elitism = False
                new_improved[2*i] = self.improved[self.best_sol_arg]
                #print("Son is best sol")
            elif self.hls.lsga != TypeLSGA['None'] and h1 == self.population[p1]:
                new_improved[2*i] = self.improved[p1]
            if h2 == self.best_sol:
                apply_elitism = False
                new_improved[2*i+1] = self.improved[self.best_sol_arg]
                #print("Son is best sol")
            elif self.hls.lsga != TypeLSGA['None'] and h2 == self.population[p2]:
                new_improved[2*i+1] = self.improved[p2]
                    
        # Fills the new population with old solutions.
        for i in range(2*self.crossed_pairs, self.pop_size):
            # Selects a solution and copy it.
            arg_sol = self.tournamentSelection()
            sol = copy.deepcopy(self.population[arg_sol])
            # Mutates the solution.
            sol.mutate(self.num_mut)                
            if random.random() <= self.prob_last_mut:
                sol.mutate()
                self.num_evaluations+=1
            elif self.num_mut > 0:
                self.num_evaluations+=1
            else:
                new_improved[i] = self.improved[arg_sol]
                        
            if sol == self.best_sol:
                new_improved[i] = self.improved[self.best_sol_arg]
                apply_elitism = False
                #print("Copy is best sol")            
            new_population[i] = sol

        self.ovalues = np.fromiter(map(lambda x: x.getObjectiveValue(), new_population), dtype=np.int64)

        # Apply the elitism if needed.
        if apply_elitism:
            #print("Applying elitism...")
            worst = np.argmax(self.ovalues)
            new_population[worst] = self.best_sol
            new_improved[worst] = self.improved[self.best_sol_arg]
            self.ovalues[worst] = self.best_sol.getObjectiveValue()

        self.population = new_population
        self.improved = new_improved
        #print(self.improved)

    def applyLocalSearch(self, rand = False):

        #print("Going to apply ls", self.num_evaluations)
        # If it has already been improved return false.
        if np.all(self.improved):
            return False

        # Choose the solution to improve.
        best_ni = np.argmin(self.improved) if rand else np.argmax((np.ones(self.pop_size)-
                                                                   self.improved) / self.ovalues)

        #print("LS. Before:", self.ovalues[best_ni], best_ni == np.argmin(self.ovalues))
        self.num_evaluations+= LocalSearch.localSearch(self.population[best_ni],
                                                       self.hls.local_search, self.hls.max_evals)
        self.ovalues[best_ni] = self.population[best_ni].getObjectiveValue()
        self.improved[best_ni] = True
        #print("    After:", self.ovalues[best_ni])
        #print("Applied ls", self.num_evaluations)
        return True
        
    def updateBestSol(self):
        self.best_sol_arg = np.argmin(self.ovalues)
        self.best_sol = self.population[self.best_sol_arg]

    def diversity(self):
        return numbaDiversity(np.array(list(map(lambda x: x.perm, self.population))))

class SGA(GeneticAlgorithm):

    """ Implementation of a Stationary Genetic Algorithm (SGA).
    A SGA first build a population using random solutions.
    The evolution procedure consist in crossing two parents producing
    two children, which might be mutated. The two children substitute
    the worst chromosomes if they are better than them.
    """

    def __init__(self, problem, verbose = False, print_aux_info = False, pop_size = -1, crossover = CrossType['Position'],
                 hybrid_ls = HybridizationLSGA(), mut_prob = 0.001):
        """ Initializes the GGA. 
        The default population size is 50.
        """
        super().__init__(problem, verbose, print_aux_info, pop_size, crossover, hybrid_ls)
        # Chooses the population size. It is always an ever number (by default 50).
        self.pop_size = pop_size + pop_size % 2 if pop_size > 0 else 50
        # Mutation probability
        self.mut_prob = 0.001 if mut_prob < 0 else mut_prob
        # Minimum number of mutations per solution
        self.num_mut = math.floor(self.pop_size*self.mut_prob)
        # Probability of the last mutation.
        self.prob_last_mut = self.pop_size*self.mut_prob - self.num_mut
        
    def initialComputations1(self):
        """ Initializes the population with random solutions."""
        super().initialComputations1()
        self.initializePopulation(True, None, True)

    def evolve(self):
        """
        Selects two solution using a binary tournament selection. These chromosomes
        are crossed, obtaining two children which are mutated with probability mut_prob.
        These children replace the worst solutions of the population in case they are better.
        """
        p1 = self.tournamentSelection()
        p2 = self.tournamentSelection()
        h1, h2 = self.cross(self.population[p1][0],self.population[p2][0])

        # Mutates the solutions.
        h1.mutate(self.num_mut)
        h2.mutate(self.num_mut)
        if random.random() <= self.prob_last_mut:
            h1.mutate()
        if random.random() <= self.prob_last_mut:
            h2.mutate()

        # If they are copies tell so.
        copy1 = False
        if self.hls.lsga != TypeLSGA['None'] and h1 == self.population[p1][0]:
            copy1 = self.population[p1][1]
            h1.ovalue = self.population[p1][0].ovalue

        copy2 = False
        if self.hls.lsga != TypeLSGA['None'] and h2 == self.population[p2][0]:
            copy2 = self.population[p2][1]
            h2.ovalue = self.population[p2][0].ovalue
                       
        # Adds the solutions and deletes the 2 worst solutions of the population.
        self.population.update([(h1, copy1), (h2, copy2)])
        del self.population[0:2]

    def applyLocalSearch(self, rand = False):
        # Get information from the population
        self.improved = np.fromiter(map(lambda x: x[1], self.population), np.bool_)
        self.ovalues = np.fromiter(map(lambda x: x[0].getObjectiveValue(), self.population), np.int64)
        
        #print("Before")
        #print(list(map(lambda p: (p[0].getObjectiveValue(),p[1]), self.population)))

        # If it has already been improved return false.
        if np.all(self.improved):
            return False

        # Choose the solution to improve.
        best_ni = random.choice(np.where(self.improved == False)[0]) if rand else np.argmax((self.improved ==
                                                                                             False) / self.ovalues)
        sol = self.population[best_ni][0]
        del self.population[best_ni]
        self.num_evaluations += LocalSearch.localSearch(sol, self.hls.local_search, self.hls.max_evals)
        self.population.add((sol, True))
        #print("After")
        #print(list(map(lambda p: (p[0].getObjectiveValue(),p[1]), self.population)))
        return True

    def updateBestSol(self):
        self.best_sol = self.population[-1][0]

    def diversity(self):
        return numbaDiversity(np.array(list(map(lambda x: x[0].perm, self.population))))

class GADEGD(GeneticAlgorithm):
    """ Implementation of GADEGD (Genetic Algorithm with Diversity Equilibrium based on Greedy Divirsification).
    GADEGD first build a population using random solutions.
    The evolution procedure consist in building a new generation, that is, a new population
    whose chromosomes are obtained from the current population by randomly sorting the population and crossing 
    the adjacent pairs (1 child per pair). The new chromosomes compete with their main parent, substituting it 
    in the population if it is better. Afterwards, the greedy divirsification prodecure is applied.
    """

    def __init__(self, problem, verbose = False, print_aux_info = False, pop_size = -1, crossover = CrossType['Position'],
                 hybrid_ls = HybridizationLSGA(), greedy = None):
        """ Initializes the GGA. 
        The default population size is 64.
        """
        # Chooses the population size. It is always an even number (by default 50).
        self.pop_size = pop_size + pop_size % 2 if pop_size > 0 else 64
        # Greedy algorithm used
        self.greedy =  greedy  if greedy != None else RandomizedIndividualGreedy(problem, 0.1)
        
        super().__init__(problem, verbose, print_aux_info, self.pop_size, crossover, hybrid_ls)

    def initialComputations1(self):
        """ Initializes the population with random solutions."""
        super().initialComputations1()
        self.initializePopulation()
        self.num_greedy = 0
        self.num_reemplacements = 0
        
    def evolve(self):
        """
        The population evolves using a random adjacent selection and a competition between parents and children.
        """

        order = np.arange(self.pop_size)
        np.random.shuffle(order)

        # Computes the children.
        children = [None] * self.pop_size
        for i in range(0, self.pop_size):
            children[i], evals = self.population[order[i]].cross(self.population[order[(i+1) % self.pop_size]], self.crossover, False)
            self.num_evaluations += evals

        for i in range(0, self.pop_size):
            # Adds the new child to the population if it is better than its main parent.
            if children[i] > self.population[order[i]]:
                # and children[i] != self.population[order[i]] and
                # children[i] != self.population[order[(i+1) % self.pop_size]]:
                self.population[order[i]] = children[i]
                self.improved[order[i]] = False
                self.num_reemplacements += 1

        self.greedyDiversification()

    def applyLocalSearch(self, rand = False):

        # If it has already been improved return false.
        if np.all(self.improved):
            return False

        # Choose the solution to improve.
        if rand:
            best_ni =  np.random.choice(np.where(self.improved == False)[0])
        else:
            self.ovalues = np.fromiter(map(lambda x: x.getObjectiveValue(), self.population), np.int64)
            best_ni = np.argmax((np.ones(self.pop_size)- self.improved) / self.ovalues)

        self.num_evaluations+= LocalSearch.localSearch(self.population[best_ni],
                                                       self.hls.local_search, self.hls.max_evals)
        self.improved[best_ni] = True

        return True

    def greedyDiversification(self):
        order = argsort(self.population)
        self.improved = self.improved[order]
        self.population = [self.population[i] for i in order]        
        for i in range(0, self.pop_size-1):
            if self.population[i] == self.population[i+1]:
                self.population[i] = self.greedy.buildSolution()
                self.improved[i] = False
                self.num_greedy += 1
                self.num_evaluations += 1

    def updateBestSol(self):
        self.best_sol_arg = self.population.index(max(self.population))
        self.best_sol = self.population[self.best_sol_arg]
        
    def diversity(self):
        return numbaDiversity(np.array(list(map(lambda x: x.perm, self.population))))

    
@jit(int64(int64[:]), cache=True, nopython=True)
def numbaTournamentSelection(ovalues):
    # Selects two random solutions of the population.
    ran1 = random.randint(0, len(ovalues)-1)
    ran2 = random.randint(0, len(ovalues)-1)
    # Compares the two random solutions, and return the best
    return ran1 if ovalues[ran1] < ovalues[ran2] else ran2 

@jit(int64(int64[:,:]), cache=True, nopython=True)
def numbaDiversity(perms):
    d = 0
    for i in range(0, len(perms)):
        for j in range(i+1, len(perms)):
            d += numbaDistance(perms[i], perms[j])
    return 2 * d / (len(perms) * (len(perms)-1))
