#########################################################################
# Author: Andrés Herrera Poyatos
# Date: April, 2017
# Abstract solution class for optimization problems.
#########################################################################

import random

from problem import *

class AbstractSolution:

    # Initializes an abstract solution from the problem.
    def __init__(self, problem):
        self.problem = problem
        self.objective_value = -1
        self.is_valid = False
        self.initializeData()

    # Initializes the solution data.
    def initializeData(self):
        raise NotImplementedError

    # Gets the solution objective value.
    def getObjectiveValue():
        if is_valid:
            if objective_value == -1:
                return computeObjectiveValue()
            else:
                return objective_value
        else:
            return -1

    # Computes the solution objective value.
    def computeObjectiveValue():
        raise NotImplementedError

class Solution(AbstractSolution):

    def __init__(self, problem, random = True):
        super().__init__(problem)

    def initializeData(self, problem, random = True):
        self.permutation = np.random.permutation(problem.N)
