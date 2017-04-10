#########################################################################
# Author: Andrés Herrera Poyatos
# Date: April, 2017
# Solution class for permutation based combinatorial problems.
#########################################################################

import random
from numba import jit, int64, void, boolean          # import the decorator
from enum import Enum

from AbstractSolution import *
from QAP import *
from Aux import *

"""Enum with all the crossovers operators types."""
CrossType = Enum('CrossType', 'Position PMX OX')
            
class Solution(AbstractSolution):

    """
    Class which represents a solution for a combinatorial problem 
    such that solutions are permutations with a fixed size.
    """
    
    def __init__(self, problem, random = True, structure = None):
        """ Initializes an abstract solution from the problem. 
        The solution general data is initialized by default.
        Then it calls the initializeData method.
        """
        super().__init__(problem, random, structure)

    def initializeData(self, problem, random, structure):
        """ Initalizes the permutation of the solution.
        By default the permutation is randomly selected (random = True).
        If random is False, then the permutation is taken from structure.
        A none structure implies that the permutation is empty and hence
        it is initialized to an array with -1 components. 
        """

        if random and structure is None:
            self.perm =  np.random.permutation(problem.N).astype(np.int64)
            self.algorithm = 'random'
            self.is_valid = True
        elif structure is not None:
            self.perm = structure
            self.is_valid = True
        else:
            self.perm = -np.ones(problem.N, dtype = np.int64)

    def computeObjectiveValue(self):
        """ Computes the solution objective value. 
        It calls the corresponding numba function.
        """
        self.ovalue = numbaComputeObjectiveValueQAP(self.perm, self.problem.weights, self.problem.distances)
        return self.ovalue

    def cross(self, p, cross_type):
        """ Crosses the solutions self and p to obtain two new solutions. 
        We say that the new solutions are children of self and p. 
        The crossover operator is chosen by cross_type.
        """
        s1 = -np.ones(self.problem.N, dtype = np.int64)
        s2 = -np.ones(self.problem.N, dtype = np.int64)
        if cross_type == CrossType['Position']:
            crossPosition(s1, s2, self.perm, p.perm)
        elif cross_type == CrossType['PMX']:
            crossPMX(s1, s2, self.perm, p.perm)
        else:
            crossOX(s1, s2, self.perm, p.perm)

        return Solution(self.problem, False, s1), Solution(self.problem, False, s2)
        
    def mutate(self):
        """ Mutates the solution. The mutation consist of applying a random transposition."""
        i = random.randint(0, self.problem.N-1)
        j = random.randint(0, self.problem.N-1)
        if self.ovalue > 0:
            self.ovalue += applyTranspositionQAP(self.perm, i, j, self.problem.weights, self.problem.distances)
    
        self.perm[i], self.perm[j] = exchange(self.perm[i], self.perm[j])
        
    def fullPrint(self):
        """ Prints the solution information completely. """
        print("The solution has objective value", self.getObjectiveValue(), ".")
        print("The solution has been built by the algorithm", self.algorithm, ".")
        print("The permutation is:")
        print(self.perm)


@jit(boolean(int64[:]), cache=True)
def isPerm(perm):
    return np.array_equal(np.sort(perm), np.array(range(0,len(perm))))
        
@jit(int64(int64[:], int64[:,:], int64[:,:]), cache=True, nopython=True)
def numbaComputeObjectiveValueQAP(perm, weights, distances):
    """ Numba optimization for computing the solution objective value
    of a solution to a QAP problem."""
    ovalue = 0
    for i in range(0, len(perm)):
        for j in range(0, len(perm)):
            ovalue += weights[i, j] * distances[perm[i], perm[j]]
    return ovalue

@jit(int64(int64[:], int64, int64, int64[:,:], int64[:,:]), cache=True, nopython=True)
def applyTranspositionQAP(perm, i, j, weights, distances):
    """ Numba optimization for computing the new solution objective value
    after applying a transposition (i,j). Version for the QAP problem."""
    s = 0
    for k in range(0, len(perm)):
        if k != i and k != j:
            s += weights[i, k] * (distances[perm[j],perm[k]] - distances[perm[i],perm[k]])
            s += weights[k, i] * (distances[perm[k],perm[j]] - distances[perm[k],perm[i]])
            s += weights[j, k] * (distances[perm[i],perm[k]] - distances[perm[j],perm[k]])
            s += weights[k, j] * (distances[perm[k],perm[i]] - distances[perm[k],perm[j]])
    return s

@jit(void(int64[:], int64[:], int64[:], int64[:]), cache=True, nopython=True)
def crossPMX(s1, s2, p1, p2):
    """ Crossover PMX (Partially-Mapped Crossover) implemented with numba.
    It selects uniformly at random  two integers 0 <= i,j < N which are named cut points.
    We take s1[i:j+1] = p2[i:j+1] and s2[i:j+1] = p1[i:j+1]. The pairs (p1[i], p2[i]), ...,
    (p1[j], p2[j]) are called partial mappings. They define a direct graph. 
    The rest of s1 is defined as in p1. However, it may happen that an element k of p1 is 
    already used in s1 (it was taken from p2). Then, there is a partial mapping (t,k).
    We use t instead of k. If t is already being used, then we repeat the process. 
    Essentially, we are using the farthest node which can be reached from k in the 
    inverse graph of the partial mappings. For s2 we proceed analogously, but using
    the partial mapping graph, instead of its inverse.
    Example: p1 = (1 2 3 4 5 6 7 8) and p2 = (3 7 5 1 6 8 2 4), i = 3 and j = 5. Then
    s1 = (4 2 3 1 6 8 7 5) and s2 = (3 7  4 5 6 ).
    """
    i = random.randint(0, len(p1)-1)
    j = random.randint(0, len(p1)-1)

    # Does the assigments s1[i:j+1] = p2[i:j+1] and s2[i:j+1] = p1[i:j+1].
    # Define the mappings.
    t = i
    k = 0
    s = j-i+1 if j >= i else len(p1)-(i-j)+1
    mappings1 = np.zeros((2,s))
    mappings2 = np.zeros((2,s))
    while True:
        s1[t] = p2[t]
        s2[t] = p1[t]

        mappings1[0][k] = s1[t] 
        mappings1[1][k] = p1[t] 
        mappings2[0][k] = s2[t] 
        mappings2[1][k] = p2[t] 
        
        if t == j:
            break

        t = (t+1)%len(p1)
        k+=1

    m1 = np.sort(mappings1[0])
    m2 = np.sort(mappings2[0])
    
    # Fulfil the rest of the children.
    t = (j+1) % len(p1)
    while t != i:
        f = np.searchsorted(m1, p1[t])
        if f == len(m1) or m1[f] != p1[t]:
            s1[t] = p1[t]
        else:
            fa = np.where(mappings1[0] == p1[t])[0]
            f = fa[0]
            k = f
            if mappings1[1][f] != p1[t]:
                l = mappings1[1][f]
                fa = np.where(mappings1[0] == l)[0]
                while len(fa) > 0:
                    f = fa[0]
                    mappings1[1][k] = mappings1[1][f]
                    k = f
                    l = mappings1[1][f]
                    fa = np.where(mappings1[0] == l)[0]
            s1[t] = mappings1[1][k]
            
        f = np.searchsorted(m2, p2[t])
        if f == len(m2) or m2[f] != p2[t]:
            s2[t] = p2[t]
        else:
            fa = np.where(mappings2[0] == p2[t])[0]
            f = fa[0]
            k = f
            if mappings2[1][f] != p2[t]:
                l = mappings2[1][f]
                fa = np.where(mappings2[0] == l)[0]
                while len(fa) > 0:
                    f = fa[0]
                    mappings2[1][k] = mappings2[1][f]
                    k = f
                    l = mappings2[1][f]
                    fa = np.where(mappings2[0] == l)[0]
            s2[t] = mappings2[1][k]

        t = (t+1) % len(p2)

@jit(void(int64[:], int64[:], int64[:], int64[:]), cache=True, nopython=True)
def crossPosition(s1, s2, p1, p2):
    """ Position crossover implemented with numba.
    Given two permutations p1 and p2, the son permutation
    is defined as s[i]=p1[i] when p1[i] = p2[i].
    The rest of the permutation is randomly defined.
    Since we have to produce two children, we randomly
    finish one of them and we use the reverse order
    to finish the other one. Consequently, they are always
    different.
    """
    count = 0
    not_equal = []
    for i in range(0, len(p1)):
        if p1[i] == p2[i]:
            s1[i] = p1[i]
            s2[i] = p1[i]
        else:
            not_equal.append(i)
    not_equal = np.array(not_equal)
    random.shuffle(not_equal)
    j = 0
    for i in range(0, len(p1)):
        if s1[i] < 0:
            s1[i] = p1[not_equal[j]]
            s2[i] = p1[not_equal[-j-1]]
            j += 1
