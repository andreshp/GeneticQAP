#########################################################################
# Author: Andrés Herrera Poyatos
# Date: April, 2017
# GRASP implementation.
#########################################################################

from Heuristic import Heuristic
from Solution import *
from LocalSearch import *

class GRASP(Heuristic):

    def __init__(self, problem,  greedy, verbose = False, print_aux_info = False,
                 local_search = LSType['2optb'], ls_max_evals = -1):
        super().__init__(problem, verbose, print_aux_info)
        self.greedy = greedy
        self.local_search = local_search
        self.ls_max_evals = ls_max_evals

    def initialComputations1(self):
        """Find an initial solution."""
        self.best_sol = self.greedy.buildSolution()
        self.num_evaluations = 1 + LocalSearch.localSearch(self.best_sol,
                                                           self.local_search, self.ls_max_evals)
        self.num_greedy += 1
        self.num_ls += 1
       
    def iteration(self):
        """Builds a new solution and saves it if it is the best one found."""
        new_sol = self.greedy.buildSolution()
        self.num_evaluations += 1 + LocalSearch.localSearch(new_sol,
                                                            self.local_search, self.ls_max_evals)
        self.num_greedy += 1
        self.num_ls += 1
        if new_sol > self.best_sol:
            self.best_sol = new_sol

class PathRelinking(Heuristic):

    def __init__(self, problem,  greedy, verbose = False, print_aux_info = False,
                 local_search = LSType['2optb'], ls_max_evals = -1, pop_size = -1):
        super().__init__(problem, verbose, print_aux_info)
        self.greedy = greedy
        self.local_search = local_search
        self.ls_max_evals = ls_max_evals
        self.pop_size = pop_size if pop_size > 0 else 15
        self.population = []

    def initialComputations1(self):
        """Find an initial solution."""
        self.best_sol = self.greedy.buildSolution()
        self.num_evaluations = 1 + LocalSearch.localSearch(self.best_sol,
                                                           self.local_search, self.ls_max_evals)
        self.population.append(self.best_sol)
        self.num_greedy += 1
        self.num_ls += 1
       
    def iteration(self):
        """Builds a new solution and saves it in the elite set if its not full. Otherwise, 
        a path relinking is applied to the new solution and a solution of the elite set."""

        new_sol = self.greedy.buildSolution()
        self.num_evaluations += 1 + LocalSearch.localSearch(new_sol,
                                                            self.local_search, self.ls_max_evals)
        self.num_greedy += 1
        self.num_ls += 1

        if len(self.population) < self.pop_size:
            distances = np.fromiter(map(lambda x: x.distance(new_sol), self.population), dtype=np.int64)
            if np.min(distances) > 0:
                self.population.append(new_sol)
        else:
            distances = np.fromiter(map(lambda x: x.distance(new_sol), self.population), dtype=np.int64)
            random_distance = random.random() * np.sum(distances)
            distances_sum = 0
            elite_sol_index = -1
            for i in range(0, len(distances)-1):
                distances_sum += distances[i]
                if distances_sum <= random_distance:
                    elite_sol_index = i
                    break
            if elite_sol_index == -1:
                elite_sol_index = len(distances)-1
            elite_sol = self.population[elite_sol_index]
            pr_sol = self.pathRelinking(new_sol, elite_sol)
            worst_sols = list(filter(lambda x: pr_sol >= self.population[x], range(0,self.pop_size)))
            if len(worst_sols) >= 1:
                 pr_distances = np.fromiter(map(lambda x: self.population[x].distance(pr_sol), worst_sols),
                                            dtype=np.int64)
                 worst_index = worst_sols[np.argmin(pr_distances)]
                 self.population[worst_index] = pr_sol
                 self.num_reemplacements += 1
                 new_sol = pr_sol

        if new_sol > self.best_sol:
            self.best_sol = new_sol

    def pathRelinking(self, s1, s2):
        sp1 = -np.ones(self.problem.N, dtype=np.int64)
        sp2 = -np.ones(self.problem.N, dtype=np.int64)
        cost1, evals1, ls_calls1 = numbaPathRelinkingLocalSearch(sp1, s1.perm, s1.ovalue, s2.perm, s2.ovalue,
                                                    self.problem.weights, self.problem.distances)
        cost2, evals2, ls_calls2 = numbaPathRelinkingLocalSearch(sp2, s2.perm, s2.ovalue, s1.perm, s1.ovalue,
                                                    self.problem.weights, self.problem.distances)
        self.num_evaluations += evals1 + evals2
        self.num_ls += ls_calls1 + ls_calls2
        if np.alltrue(sp2 == s2.perm):
            sol = Solution(self.problem, False, sp1)
            sol.ovalue = cost1            
        elif cost1 < cost2:
            sol = Solution(self.problem, False, sp1)
            sol.ovalue = cost1                        
        else:
            sol = Solution(self.problem, False, sp2)
            sol.ovalue = cost2
            
        return sol

@jit(types.UniTuple(int64,3)(int64[:], int64[:], int64, int64[:], int64, int64[:,:], int64[:,:]),
     cache=True, nopython=True)
def numbaPathRelinkingLocalSearch(best_sol, p1, cp1, p2, cp2, weights, distances):
    """ Path Relinking crossover with local search implemented using numba.
    """
    s = np.zeros(len(p1), dtype = np.int64)
    s[:] = p1[:]
    sinverse = np.argsort(s)
    current_cost = cp1
    best_cost = -1
    dist = numbaDistance(p1, p2)
    # If the solutions differ in a transposition, then the best solution is returned.
    if dist <= 2:
        if cp1 >= cp2:
            best_sol[:] = p1[:]
            return cp1, 0, 0
        else:
            best_sol[:] = p2[:]
            return cp2, 0, 0

    num_evaluations = 0
    num_ls = 0
    for i in range(0, len(p1)-2):
        if s[i] != p2[i]:
            # Computes the new cost
            cost_exchange = applyTranspositionQAP(s, i, sinverse[p2[i]], weights, distances)
            current_cost += cost_exchange
            # Computes the new distance
            dist -= 2 if s[i] == p2[sinverse[p2[i]]] else 1
            # Makes the exhange
            s[sinverse[p2[i]]] = s[i]
            sinverse[s[i]] = sinverse[p2[i]]
            s[i] = p2[i]
            sinverse[p2[i]] = i

            num_evaluations += 1
            # Updates the best solution found
            if cost_exchange < 0: 
                new_sol = np.zeros(len(p1), dtype = np.int64)
                new_sol[:] = s[:]
                new_cost, new_evals = numbaLocalSearch(new_sol, current_cost, 1, -1, weights, distances)
                num_ls += 1
                num_evaluations += new_evals
                if best_cost < 0 or best_cost > new_cost:
                    best_sol[:] = new_sol[:]
                    best_cost = new_cost

            if dist <= 2:
                break

    if best_cost == -1:
        best_sol[:] = p1[:]
        return cp1, num_evaluations, num_ls
    else:
        return best_cost, num_evaluations, num_ls
