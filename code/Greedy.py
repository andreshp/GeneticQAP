#########################################################################
# Author: Andrés Herrera Poyatos
# Date: April, 2017
# Greedy algorithms for QAP.
#########################################################################

import random
from numba import jit, int64          # import the decorator
import itertools
import math

from Solution import *
from Heuristic import *

@jit(int64[:](int64[:]), cache=True, nopython=True)
def invertPermutation(p):
    """ The argument p is assumed to be some permutation of 0, 1, ..., len(p)-1. 
    Returns the inverse permutation, that is, an array s, where s[i] gives the index of i in p."""
    s = np.empty(p.size, p.dtype)
    s[p] = np.arange(p.size)
    return s

class Greedy(Heuristic):

    def __init__(self, problem):
        self.problem = problem
    
    def greedySelectionFunction(self, partial_sol, elem, pos):
        raise NotImplementedError
    
    def initialSolution(self):
        raise NotImplementedError        

    def buildSolution(self):
        raise NotImplementedError

    def initialComputations1(self):
        self.best_sol = self.buildSolution()
        
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
        self.apweights = np.argsort(-self.pweights, kind='mergesort')
        # Permutation which sorts the array pdistances. That is, pweights[apweights] = pweights.sort()
        # Hence apdistances[i] = position with the i-th smallest pdistance.
        self.apdistances = np.argsort(self.pdistances, kind='mergesort')
        # Inverse permutation of apweights. That is, pweights_pos[i] is the position of the i element in the sorted array.
        self.pweights_pos = invertPermutation(self.apweights)

    def buildSolution(self):
        #print(self.pweights)
        #print(self.pdistances)
        perm = np.array([self.apdistances[ele] for ele in self.pweights_pos])
        return Solution(self.problem, structure = perm)

class GreedyIndividual(Greedy):

    def __init__(self, problem):
        super().__init__(problem)
    
    def initialSolution(self):    
        """ Builds an initial solution taking a random perm[0]"""
        # Hacerlo greedy. Seguir órdenes arbitrarios.
        partial_sol = Solution(self.problem, False)
        partial_sol.perm[0] = random.randint(0, self.problem.N-1)
        self.novisited_w = np.fromiter(range(0,self.problem.N), dtype = np.int64)
        self.novisited_d = np.fromiter(range(0,self.problem.N), dtype = np.int64)
        self.novisited_w = np.delete(self.novisited_w, 0)
        self.novisited_d = np.delete(self.novisited_d, partial_sol.perm[0])
        self.updateGreedySelectionFunction(0, partial_sol.perm[0], self.novisited_w, self.novisited_d)
        self.order = range(1, self.problem.N)
        return partial_sol

    def selectGreedyPosition(partial_sol, element, positions):
        raise NotImplementedError

    def updateGreedySelectionFunction(self, elem, pos, elements, positions):
        raise NotImplementedError

    def buildSolution(self):
        partial_sol = self.initialSolution()

        for elem in self.order:
            pos = self.selectGreedyPosition(partial_sol, elem, self.novisited_d)
            self.novisited_w = self.novisited_w[self.novisited_w != elem]
            self.novisited_d = self.novisited_d[self.novisited_d != pos]
            self.updateGreedySelectionFunction(elem, pos, self.novisited_w, self.novisited_d)

        partial_sol.is_valid = True
        return partial_sol
    
class GreedyPairs(Greedy):

    def __init__(self, problem):
        super().__init__(problem)

    def initialSolution(self):        
        # List with the sum of the weights associated to each element. These are called potential weights.
        pweights = self.problem.weights.sum(axis=1).flatten() + self.problem.weights.sum(axis=0).flatten()
        # List with the sum of the distancess associated to each position. These are called potential distances.
        pdistances = self.problem.distances.sum(axis=1).flatten() + self.problem.distances.sum(axis=0).flatten()
        sol = Solution(self.problem, False)

        # Computes the barrier for each lrc.
        barrierw = (1-self.alpha) * np.max(pweights) + self.alpha * np.min(pweights)
        barrierd = (1-self.alpha) * np.min(pdistances) + self.alpha * np.max(pdistances)
        # Computes the lrcs.
        lrcw = list(filter(lambda x: pweights[x] >= barrierw, range(0,self.problem.N)))
        lrcd = list(filter(lambda x: pdistances[x] <= barrierd, range(0,self.problem.N)))

        # Select a random element from the lrcs.
        pw1 = random.randint(0, len(lrcw)-1)
        pd1 = random.randint(0, len(lrcd)-1)
        w1 = lrcw[pw1]
        d1 = lrcd[pd1]
        sol.perm[w1] = d1

        w2 = -1
        d2 = -1
        if len(lrcw) >= 2 and len(lrcd) >= 2:
            pw2 = (random.randint(1, len(lrcw)-1) + pw1) % len(lrcw)
            pd2 = (random.randint(1, len(lrcd)-1) + pd1) % len(lrcd)
            w2 = lrcw[pw2]
            d2 = lrcd[pd2]
            sol.perm[w2] = d2

        # Builds the arrays with the non used elements and positions.
        self.novisited_w = np.fromiter(range(0,self.problem.N), dtype = np.int64)
        self.novisited_d = np.fromiter(range(0,self.problem.N), dtype = np.int64)
        if w2 == -1:
            self.novisited_w = np.delete(self.novisited_w, w1)
            self.novisited_d = np.delete(self.novisited_d, d1)
        else:
            self.novisited_w = self.novisited_w[(self.novisited_w != w1) & (self.novisited_w != w2)]
            self.novisited_d = self.novisited_d[(self.novisited_d != d1) & (self.novisited_d != d2)]

        return sol

    def selectGreedyPair(partial_sol, elements, positions):
        raise NotImplementedError

    def buildSolution(self):
        partial_sol = self.initialSolution()
        while len(self.novisited_d) > 0:
            ele, pos = self.selectGreedyPair(partial_sol, self.novisited_w, self.novisited_d)
            self.novisited_w = self.novisited_w[self.novisited_w != ele]
            self.novisited_d = self.novisited_d[self.novisited_d != pos]
        partial_sol.is_valid = True
        return partial_sol

class RandomizedIndividualGreedy(GreedyIndividual):

    def __init__(self, problem, alpha):
        super().__init__(problem)
        self.alpha = alpha

    def initialSolution(self):    
        """ Builds an initial solution taking a random perm[0]"""
        # List with the sum of the weights associated to each element. These are called potential weights.
        self.pweightsx = self.problem.weights.sum(axis=1).flatten()
        self.pweightsy = self.problem.weights.sum(axis=0).flatten()
        # List with the sum of the distances associated to each position. These are called potential distances.
        self.pdistancesx = self.problem.distances.sum(axis=1).flatten()
        self.pdistancesy = self.problem.distances.sum(axis=0).flatten()

        pweights = self.pweightsx + self.pweightsy
        pdistances = self.pdistancesx + self.pdistancesy
        sol = Solution(self.problem, False)

        """
        barrierw = (1-self.alpha) * np.max(pweights)
        barrierd = (1+self.alpha) * np.min(pdistances)
        lrcw = list(filter(lambda x: pweights[x] >= barrierw, range(0,self.problem.N)))
        lrcd = list(filter(lambda x: pdistances[x] <= barrierd, range(0,self.problem.N)))        
        pw1 = random.randint(0, len(lrcw)-1)
        pd1 = random.randint(0, len(lrcd)-1)

        w1 = lrcw[pw1]
        d1 = lrcd[pd1]
        sol.perm[w1] = d1

        w2 = -1
        d2 = -1
        if len(lrcw) >= 2 and len(lrcd) >= 2:
            pw2 = (random.randint(1, len(lrcw)-1) + pw1) % len(lrcw)
            pd2 = (random.randint(1, len(lrcd)-1) + pd1) % len(lrcd)
            w2 = lrcw[pw2]
            d2 = lrcd[pd2]
            sol.perm[w2] = d2
        """
        
        # Selects the first elements and positions of the solution.
        w1, d1, w2, d2 = numbaRandomizedIndividualGreedyInitialization(sol.perm, self.alpha, pweights, pdistances)

        # Builds the arrays with the non used elements and positions.
        self.novisited_w = np.fromiter(range(0,self.problem.N), dtype = np.int64)
        self.novisited_d = np.fromiter(range(0,self.problem.N), dtype = np.int64)
        if w2 == -1:
            self.novisited_w = np.delete(self.novisited_w, w1)
            self.novisited_d = np.delete(self.novisited_d, d1)
            self.updateGreedySelectionFunction(w1, d1, self.novisited_w, self.novisited_d)
        else:
            self.novisited_w = self.novisited_w[(self.novisited_w != w1) & (self.novisited_w != w2)]
            self.novisited_d = self.novisited_d[(self.novisited_d != d1) & (self.novisited_d != d2)]
            self.updateGreedySelectionFunction(w1, d1, self.novisited_w, self.novisited_d)
            self.updateGreedySelectionFunction(w2, d2, self.novisited_w, self.novisited_d)

        # Order the non visisted elements from highest to smallest weight.
        # This order will be used for building the solution.
        self.order = list(self.novisited_w)
        self.order.sort(key = lambda x: -pweights[x])

        return sol
    
    def greedySelectionFunction(self, partial_sol, elem, pos):
        return numbaRandomizedIndividualGreedySelectionFunction(partial_sol.perm, elem, pos,
                                                  self.pweightsx[elem], self.pweightsy[elem],
                                                  pdistancesx[pos], pdistancesy[pos],
                                                  self.problem.weights, self.problem.distances)

    def selectGreedyPosition(self, partial_sol, elem, positions):
        return numbaRandomizedIndividualGreedy(partial_sol.perm, self.alpha, elem, positions,
                                               self.pweightsx[elem], self.pweightsy[elem],
                                               self.pdistancesx, self.pdistancesy,
                                               partial_sol.problem.weights, partial_sol.problem.distances)

    def updateGreedySelectionFunction(self, elem, pos, elements, positions):
        updatePotentialMatrix(elem, elements, self.pweightsx, self.pweightsy, self.problem.weights)
        updatePotentialMatrix(pos, positions, self.pdistancesx, self.pdistancesy, self.problem.distances)
        
@jit(float64(int64[:], int64, int64, int64, int64, int64, int64, int64[:,:], int64[:,:]), cache=True, nopython=True)
def numbaRandomizedIndividualGreedySelectionFunction(perm, elem, pos, pweightx, pweighty, pdistancex, pdistancey, weights, distances):
        v = 0
        for i in range(0,len(perm)):
            if perm[i] != -1:
                v += weights[i, elem]*distances[perm[i], pos]
                v += weights[elem, i]*distances[pos, perm[i]]
        return v + (pdistancex*pweightx + pdistancey*pweighty) / len(perm)

@jit(int64(int64[:], float64, int64, int64[:], int64, int64, int64[:], int64[:], int64[:,:], int64[:,:]), cache=True, nopython=True)
def numbaRandomizedIndividualGreedy(perm, alpha, elem, positions, pweightx, pweighty, pdistancesx, pdistancesy, weights, distances):
    ming = math.inf
    for i in positions:
        cost = numbaRandomizedIndividualGreedySelectionFunction(perm, elem, i,
                                                                pweightx, pweighty,
                                                                pdistancesx[i], pdistancesy[i],
                                                                weights, distances)
        ming = min(ming, cost)


    bound = (1+alpha)*ming+0.0001
    lrc = []
    for i in positions:
        cost = numbaRandomizedIndividualGreedySelectionFunction(perm, elem, i,
                                                                pweightx, pweighty,
                                                                pdistancesx[i], pdistancesy[i],
                                                                weights, distances)
        if cost <= bound:
            lrc.append(i)
        
    perm[elem] = lrc[random.randint(0, len(lrc)-1)]
    return perm[elem]

@jit(types.UniTuple(int64,4)(int64[:], float64, int64[:], int64[:]), cache=True)#, nopython=True)
def numbaRandomizedIndividualGreedyInitialization(perm, alpha, pweights, pdistances):
        barrierw = (1-alpha) * np.max(pweights)+0.0001
        barrierd = (1+alpha) * np.min(pdistances)+0.0001
        lrcw = []
        lrcd = []
        for i in range(0, len(perm)):
            if pweights[i] >= barrierw:
                lrcw.append(i)
            if pdistances[i] <= barrierd:
                lrcd.append(i)

        pw1 = random.randint(0, len(lrcw)-1)
        pd1 = random.randint(0, len(lrcd)-1)

        w1 = lrcw[pw1]
        d1 = lrcd[pd1]
        perm[w1] = d1

        w2 = -1
        d2 = -1
        if len(lrcw) >= 2 and len(lrcd) >= 2:
            pw2 = (random.randint(1, len(lrcw)-1) + pw1) % len(lrcw)
            pd2 = (random.randint(1, len(lrcd)-1) + pd1) % len(lrcd)
            w2 = lrcw[pw2]
            d2 = lrcd[pd2]
            perm[w2] = d2

        return w1, d1, w2, d2

@jit(void(int64, int64[:], int64[:], int64[:], int64[:,:]), cache=True, nopython=True)
def updatePotentialMatrix(pos, updates, px, py, matrix):
    for i in updates:
        px[i] -= matrix[i,pos]
        py[i] -= matrix[pos,i]

class RandomizedPairsGreedy(GreedyPairs):

    def __init__(self, problem, alpha):
        super().__init__(problem)
        self.alpha = alpha
   
    def greedySelectionFunction(self, partial_sol, elem, pos):
        return numbaRandomizedGreedySelectionFunction(partial_sol.perm, elem, pos,
                                                           self.problem.weights, self.problem.distances)

    def selectGreedyPair(self, partial_sol, elements, positions):
        return numbaRandomizedGreedyPairs(partial_sol.perm, self.alpha, elements, positions,
                                          partial_sol.problem.weights, partial_sol.problem.distances)
        
@jit(int64(int64[:], int64, int64, int64[:,:], int64[:,:]), cache=True, nopython=True)
def numbaRandomizedGreedySelectionFunction(perm, elem, pos, weights, distances):
        cost = 0
        for i in range(0, len(perm)):
            if perm[i] != -1:
                cost += (weights[i,elem]*distances[perm[i], pos] +
                         weights[elem,i]*distances[pos, perm[i]])
        return cost

@jit(types.UniTuple(int64,2)(int64[:], float64, int64[:], int64[:], int64[:,:], int64[:,:]), cache=True, nopython=True)
def numbaRandomizedGreedyPairs(perm, alpha, elements, positions, weights, distances):
    ming = math.inf
    maxg = -1
    for i in range(0, len(elements)):
        for j in range(0, len(positions)):
            cost = numbaRandomizedGreedySelectionFunction(perm, elements[i], positions[j], weights, distances)
            ming = min(ming, cost)
            maxg = max(maxg, cost)
    bound = round((1-alpha)*ming + alpha*maxg+0.0001)
    lrc = []
    for i in range(0, len(positions)):
        for j in range(0, len(positions)):
            cost = numbaRandomizedGreedySelectionFunction(perm, elements[i], positions[j], weights, distances)
            if cost <= bound:
                lrc.append((elements[i], positions[j]))
        
    chosen_pair = lrc[random.randint(0,len(lrc)-1)]
    perm[chosen_pair[0]] = chosen_pair[1]
    return chosen_pair
