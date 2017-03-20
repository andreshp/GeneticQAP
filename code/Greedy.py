#########################################################################
# Author: Andrés Herrera Poyatos
# Date: April, 2017
# Greedy algorithms for QAP.
#########################################################################

import random
from numba import jit, int64          # import the decorator

from Solution import *

@jit(int64[:](int64[:]), cache=True, nopython=True)
def invertPermutation(p):
    """ The argument p is assumed to be some permutation of 0, 1, ..., len(p)-1. 
    Returns the inverse permutation, that is, an array s, where s[i] gives the index of i in p."""
    s = np.empty(p.size, p.dtype)
    s[p] = np.arange(p.size)
    return s

class Greedy:

    def __init__(self, problem):
        self.problem = problem
    
    def greedySelectionFunction(self, partial_sol, elem, pos):
        raise NotImplementedError

    def updateGreedySelectionFunction(self, next_pos, remaining_positions):
        raise NotImplementedError

    def buildSolution(self):
        partial_sol = Solution(self.problem, False)
        partial_sol.perm[0] = random.randint(0, self.problem.N-1)

        # Build a dictionary with the remaining elements of the solution.
        remaining_positions = dict.fromkeys(range(0, self.problem.N))
        del remaining_positions[partial_sol.perm[0]]

        self.updateGreedySelectionFunction(partial_sol.perm[0], remaining_positions)
        
        for i in range(1, self.problem.N):
            # Update the greedySelectionFunction of the remaining elements.
            for j in remaining_positions.keys():
                remaining_positions[j] = self.greedySelectionFunction(partial_sol, i, j)
            next_pos = min(remaining_positions,  key=remaining_positions.get)
            partial_sol.perm[i] = next_pos
            del remaining_positions[next_pos]

        self.updateGreedySelectionFunction(next_pos, remaining_positions)

        partial_sol.is_valid = True
        return partial_sol
            
                
class GreedyQAP(Greedy):

    def __init__(self, problem):
        #super().__init__(problem)
        self.problem = problem
        # List with the sum of the weights associated to each element. These are called potential weights.
        self.pweights = problem.weights.sum(axis=1).flatten()
        # List with the sum of the distances associated to each position. These are called potential distances
        self.pdistances = problem.distances.sum(axis=1).flatten()
        # Permutation which sorts the array pweights in descending order. That is, pweights[apweights] = pweights[::-1].sort()
        # Hence apweights[i] = element with the i-th smallest pweight.
        self.apweights = np.argsort(-self.pweights)
        # Permutation which sorts the array pdistances. That is, pweights[apweights] = pweights.sort()
        # Hence apdistances[i] = position with the i-th smallest pdistance.
        self.apdistances = np.argsort(self.pdistances)
        # Inverse permutation of apweights. That is, pweights_pos[i] is the position of the i element in the sorted array.
        self.pweights_pos = invertPermutation(self.apweights)

    def buildSolution(self):
        #print(self.pweights)
        #print(self.pdistances)
        perm = np.array([self.apdistances[ele] for ele in self.pweights_pos])
        return Solution(self.problem, structure = perm)


@jit(int64(int64[:], int64, int64, int64[:,:], int64[:,:]), cache=True)
def numbaProperGreedySelectionFunction(perm, elem, pos, weights, distances):
        v = 0
        for i in range(0, elem):
            v += weights[i, elem]*distances[perm[i], pos]
            v += weights[elem, i]*distances[pos, perm[i]]
        return v

class ProperGreedy(Greedy):

    def __init__(self, problem):
        #super().__init__(problem)
        self.problem = problem
        # List with the sum of the weights associated to each element. These are called potential weights.
        self.pweights = problem.weights.sum(axis=1).flatten() / self.problem.N
        self.remaining_positions = None
    
    def greedySelectionFunction(self, partial_sol, elem, pos):
        v = numbaProperGreedySelectionFunction(partial_sol.perm, elem, pos, self.problem.weights, self.problem.distances)
        if self.remaining_positions != None:
            w = 0
            for i in self.remaining_positions.keys():
                w += self.problem.distances[i, pos] + self.problem.distances[pos, i]
            v += self.pweights[elem]*w
        return v

#    @jit(cache=True)
    def updateGreedySelectionFunction(self, next_pos, remaining_positions):
        pass
    
