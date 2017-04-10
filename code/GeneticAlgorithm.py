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

from Heuristic import *
from Solution import *

class GeneticAlgorithm(Heuristic):

    def __init__(self, problem, pop_size = -1):
        super().__init__(problem)
        self.pop_size = pop_size
        
    def initializePopulation(self, random = True, h = None):
        """Initializes the genetic algorithm population as random 
        solutions or using the heuristic h.
        """
        if not random and h != None:
            self.population = h.generateSolutions(self.pop_size)
        else:
            self.population = [Solution(self.problem) for i in range(0, self.pop_size)]
        self.ovalues = np.fromiter(map(lambda x: x.getObjectiveValue(), self.population), dtype=np.int64)
        self.best_sol_arg = np.argmin(self.ovalues)
        self.best_sol = self.population[self.best_sol_arg]

    def tournamentSelection(self):
        return numbaTournamentSelection(self.ovalues)

    
@jit(int64(int64[:]), cache=True, nopython=True)
def numbaTournamentSelection(ovalues):
    # Selects two random solutions of the population.
    ran1 = random.randint(0, len(ovalues)-1)
    ran2 = random.randint(0, len(ovalues)-1)
    # Compares the two random solutions, and return the best
    return ran1 if ovalues[ran1] < ovalues[ran2] else ran2 


class GGA(GeneticAlgorithm):

    def __init__(self, problem, pop_size = -1, mut_prob = 0.1, cross_prob = 0.7):
        super().__init__(problem)
        self.pop_size = pop_size + pop_size % 2 if pop_size > 0 else 60
        self.mut_prob = mut_prob
        self.cross_prob = cross_prob
        self.crossed_pairs = int(0.5*cross_prob * self.pop_size)

    def initialComputations1(self):
        self.initializePopulation()
        print(self.best_sol.getObjectiveValue())
        
    def iteration(self):
        """
        Creates a new empty population and adds new solutions to it.
        In order to do so, cross crossed_pairs pairs of parents, which are chosen
        using the tournament selection. Then mutate the obtained solutions with 
        probability mut_prob. Afterwards, fill the new population with solutions of
        the previous population, selected with the tournament selection and mutate
        these solutions analogously.
        If the best solution of the previous population, call it s, is in the new one, 
        then stop. Otherwise, find the worst solution of the new population, delete it 
        and add s to the new population. This step is called elitism.
        """
        new_population = [None]*self.pop_size

        for i in range(0, self.crossed_pairs):
            # Selects the parents.
            p1 = self.tournamentSelection()
            p2 = self.tournamentSelection()
            # Crosses the parents.
            h1, h2 = self.population[p1].cross(self.population[p2], CrossType.PMX)

            # Mutates the children.
            if random.random() <= self.mut_prob:
                h1.mutate()
            if random.random() <= self.mut_prob:
                h2.mutate()

            # Adds the new children to the new population.
            new_population[2*i] = h1
            new_population[2*i+1] = h2

        apply_elitism = True
        for i in range(2*self.crossed_pairs, self.pop_size):
            # Selects a solution.
            sol = copy.deepcopy(self.population[self.tournamentSelection()])
            is_best_sol = sol == self.best_sol_arg
            # Mutates the solution.
            if random.random() <= self.mut_prob:
                sol.mutate()
                is_best_sol = False
            new_population[i] = sol
            apply_elitism = False if is_best_sol else apply_elitism

        self.ovalues = np.fromiter(map(lambda x: x.getObjectiveValue(), new_population), dtype=np.int64)

        if apply_elitism:
            worst = np.argmax(self.ovalues)
            new_population[worst] = self.best_sol
            self.ovalues[worst] = self.best_sol.getObjectiveValue()

        self.population = new_population
        self.best_sol_arg = np.argmin(self.ovalues)
        self.best_sol = self.population[self.best_sol_arg]
        print(self.best_sol.getObjectiveValue())
