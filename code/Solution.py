#########################################################################
# Author: Andrés Herrera Poyatos
# Date: April, 2017
# Abstract solution class for optimization problems.
#########################################################################

import random

from Problem import *

class AbstractSolution:

    # Initializes an abstract solution from the problem.
    def __init__(self, problem):
        self.problem = problem
        self.ovalue = -1
        self.is_valid = False
        self.algorithm = None
        self.initializeData(problem)
        
    # Initializes the solution data.
    def initializeData(self, problem):
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
    
class Solution(AbstractSolution):

    def __init__(self, problem, random = True):
        super().__init__(problem)

    # Initalizes the permutation of the solution.
    # By default the permutation is randomly selected.
    # If random is False, then the permutation is left empty.
    def initializeData(self, problem, random = True):
        if random:
            self.perm =  np.random.permutation(problem.N)
            self.algorithm = 'random'
            self.is_valid = True
        else:
            self.perm = np.zeros(problem.N)
        
    # Computes the solution objective value.
    def computeObjectiveValue(self):
        if self.is_valid:
            self.ovalue = 0

            print(self.perm)
            for i in range(0, len(self.perm)):
                for j in range(0, len(self.perm)):
                    print(self.problem.distances)
                    self.ovalue += self.problem.weights[i][j]*self.problem.distances[self.perm[i]][self.perm[j]]
        return self.ovalue

    # Prints the solution information completely.
    def fullPrint(self):
        print("The solution has objective value", self.getObjectiveValue())
        print("The solution has been built by the algorithm", self.algorithm)
        print("The permutation is:")
        print(self.perm)
                
