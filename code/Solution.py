#########################################################################
# Author: Andrés Herrera Poyatos
# Date: April, 2017
# Abstract solution class for optimization problems.
#########################################################################

import random
from numba import jit, int64          # import the decorator

from AbstractSolution import *
from QAP import *


@jit(int64(int64[:], int64[:,:], int64[:,:]), cache=True)
def numbaComputeObjectiveValue(perm, weights, distances):
    """Numba optimization for computing the solution objective value."""
    ovalue = 0
    for i in range(0, len(perm)):
        for j in range(0, len(perm)):
            ovalue += weights[i, j] * distances[perm[i], perm[j]]
    return ovalue


class Solution(object):

    def __init__(self, problem, random = True, structure = None):
        #super().__init__(problem, random, structure)
        self.problem = problem
        self.ovalue = -1
        self.is_valid = False
        self.algorithm = None
        self.initializeData(problem, random, structure)

    def initializeData(self, problem, random = True, structure = None):
        """ Initalizes the permutation of the solution.
        By default the permutation is randomly selected.
        If random is False, then the permutation is taken from structure.
        A none structure implies that the permutation is empty. 
        """

        if random and structure is None:
            self.perm =  np.random.permutation(problem.N).astype(np.int64)
            self.algorithm = 'random'
            self.is_valid = True
        elif structure is not None:
            self.perm = structure
            self.is_valid = True
        else:
            self.perm = np.empty(problem.N, dtype = np.int64)

    def computeObjectiveValue(self):
        """ Computes the solution objective value. """
        if self.is_valid:
            self.ovalue = numbaComputeObjectiveValue(self.perm, self.problem.weights, self.problem.distances)
        return self.ovalue

    # Gets the solution objective value.
    def getObjectiveValue(self):
        if self.is_valid:
            if self.ovalue == -1:
                return self.computeObjectiveValue()
            else:
                return self.ovalue
        else:
            return -1
    
    def fullPrint(self):
        """ Prints the solution information completely. """
        print("The solution has objective value", self.getObjectiveValue(), ".")
        print("The solution has been built by the algorithm", self.algorithm, ".")
        print("The permutation is:")
        print(self.perm)
                
