#########################################################################
# Author: Andrés Herrera Poyatos
# Date: April, 2017
# LocalSearch algorithms for QAP.
#########################################################################

from enum import Enum
from numba import int64, jit, jitclass
import numpy as np

from Solution import *

LSType = Enum('LSType', '2opt 2opt_bits')

def codeLS(ls_type):
    if ls_type == LSType['2opt']:
        return 0
    else:
        return 1
    return 0

@jit(int64(int64[:], int64[:,:], int64[:,:]), cache=True, nopython=True)
def improveSolution2opt(perm, weights, distances):
    for i in range(0, len(perm)):
        for j in range(i+1, len(perm)):
            change_ovalue = applyTransposition(perm, i, j, weights, distances)
            if change_ovalue < 0:
                aux = perm[i]
                perm[i] = perm[j]
                perm[j] = aux
                return change_ovalue
    return 0

@jit(int64(int64[:], int64[:], int64[:,:], int64[:,:]), cache=True, nopython=True)
def improveSolution2optBits(perm, bits, weights, distances):
    for i in range(0, len(perm)):
        if bits[i] == 0:
            for j in range(0, len(perm)):
                if i != j:
                    change_ovalue = applyTransposition(perm, i, j, weights, distances)
                    if change_ovalue < 0:
                        aux = perm[i]
                        perm[i] = perm[j]
                        perm[j] = aux
                        bits[j] = 0
                        return change_ovalue
            bits[i] = 1
    return 0

@jit(int64(int64[:], int64, int64[:], int64, int64[:,:], int64[:,:]), cache=True, nopython=True)
def improveSolution(perm, ovalue, bits, ls_type, weights, distances):
    if ls_type == 0:
        return ovalue + improveSolution2opt(perm, weights, distances)
    elif ls_type == 1:
        return ovalue + improveSolution2optBits(perm, bits, weights, distances)
    return 0

@jit(int64(int64[:], int64, int64, int64[:,:], int64[:,:]), cache=True, nopython=True)
def numbaLocalSearch(perm, ovalue, ls_type, weights, distances):
    bits = np.zeros(len(perm), dtype = np.int64)
    novalue = improveSolution(perm, ovalue, bits, ls_type, weights, distances)
    #print("ovalue", ovalue)
    while novalue < ovalue:
        #print("novalue", novalue)
        ovalue = novalue
        novalue = improveSolution(perm, ovalue, bits, ls_type, weights, distances)
    return novalue

class LocalSearch:

    def localSearch(solution, ls_type):
        solution.ovalue = numbaLocalSearch(solution.perm,
                                           solution.getObjectiveValue(),
                                           int(codeLS(ls_type)),
                                           solution.problem.weights,
                                           solution.problem.distances)
