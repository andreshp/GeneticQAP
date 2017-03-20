#########################################################################
# Author: Andrés Herrera Poyatos
# Date: April, 2017
# Abstract solution class for optimization problems.
#########################################################################

import random

class AbstractSolution:

    # Initializes an abstract solution from the problem.
    def __init__(self, problem, random = True, structure = None):
        self.problem = problem
        self.ovalue = -1
        self.is_valid = False
        self.algorithm = None
        self.initializeData(problem, random, structure)
        
    # Initializes the solution data.
    def initializeData(self, problem, random = True, structure = None):
        raise NotImplementedError

    # Gets the solution objective value.
    def getObjectiveValue(self):
        if self.is_valid:
            if self.ovalue == -1:
                return self.computeObjectiveValue()
            else:
                return self.ovalue
        else:
            return -1

    # Computes the solution objective value.
    def computeObjectiveValue(self):
        raise NotImplementedError

    # Prints the solution information completely.
    def fullPrint(self):
        raise NotImplementedError
                
