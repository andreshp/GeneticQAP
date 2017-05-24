#########################################################################
# Author: Andrés Herrera Poyatos
# Date: April, 2017
# GRASP implementation.
#########################################################################

from Heuristic import Heuristic
from Solution import *
from LocalSearch import *

class GRASP(Heuristic):

    def __init__(self, problem,  greedy, verbose = False, local_search = LSType['2optb'], ls_max_evals = -1):
        super().__init__(problem, verbose)
        self.greedy = greedy
        self.local_search = local_search
        self.ls_max_evals = ls_max_evals

    def initialComputations1(self):
        """Find an initial solution."""
        self.best_sol = self.greedy.buildSolution()
        self.num_evaluations = 1 + LocalSearch.localSearch(self.best_sol,
                                                           self.local_search, self.ls_max_evals)

    def iteration(self):
        """Builds a new solution and saves it if it is the best one found."""
        new_sol = self.greedy.buildSolution()
        self.num_evaluations += 1 + LocalSearch.localSearch(new_sol,
                                                            self.local_search, self.ls_max_evals)
        if new_sol > self.best_sol:
            self.best_sol = new_sol
