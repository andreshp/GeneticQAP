#########################################################################
# Author: Andrés Herrera Poyatos
# Date: May, 2017
# ILS implementation.
#########################################################################

from Heuristic import Heuristic
from Solution import *
from LocalSearch import *
from SimulatedAnnealing import *
import copy

class ILS(Heuristic):

    def __init__(self, problem, verbose = False, print_aux_info = False,
                 local_search = LSType['2optb'], ls_max_evals = -1, mut_prop = -1):
        super().__init__(problem, verbose, print_aux_info)
        self.local_search = local_search
        self.ls_max_evals = ls_max_evals
        self.mut_size = int(mut_prop * self.problem.N)
        if local_search == LSType['sa']:
            self.sa = SA(problem)

    def initialComputations1(self):
        """Find an initial solution."""
        self.best_sol = Solution(self.problem)
        self.num_evaluations = 1 + LocalSearch.localSearch(self.best_sol,
                                                           self.local_search, self.ls_max_evals)

    def iteration(self):
        """Builds a new solution and saves it if it is the best one found."""
        new_sol = copy.deepcopy(self.best_sol)
        new_sol.mutateSubList(self.mut_size)
        self.num_evaluations += 1 + LocalSearch.localSearch(new_sol,
                                                            self.local_search, self.ls_max_evals)
        if new_sol > self.best_sol:
            self.best_sol = new_sol
