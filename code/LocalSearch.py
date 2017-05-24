#########################################################################
# Author: Andrés Herrera Poyatos
# Date: April, 2017
# LocalSearch algorithms for permutation based problems.
#########################################################################

from enum import Enum
from numba import int64, jit, jitclass, types, boolean
import numpy as np
from SimulatedAnnealing import *

from Solution import *
from Aux import *

LSType = Enum('LSType', '2opt 2optb sa none')

def codeLS(ls_type):
    if ls_type == LSType['2opt']:
        return 0
    elif ls_type == LSType['2optb']:
        return 1
    return -1

@jit(types.UniTuple(int64,2)(int64[:], int64, int64, int64[:,:], int64[:,:]), cache=True, nopython=True)
def improveSolution2opt(perm, evals, max_evals, weights, distances):
    """ For each transposition, check if applying it to perm improves the solution.
    If it is the case, then apply it and return how much the solution is improved."""
    for i in range(0, len(perm)):
        for j in range(i+1, len(perm)):
            change_ovalue = applyTranspositionQAP(perm, i, j, weights, distances)
            evals+=1
            if change_ovalue < 0:
                perm[i], perm[j] = exchange(perm[i], perm[j])
                return change_ovalue, evals
            if evals == max_evals:
                return 0, evals
    return 0, evals

@jit(types.UniTuple(int64,2)(int64[:], int64, int64, boolean[:], int64[:,:], int64[:,:]),
     cache=True, nopython=True)
def improveSolution2optBits(perm, evals, max_evals, bits, weights, distances):
    for i in range(0, len(perm)):
        if bits[i]:
            for j in range(0, len(perm)):
                if i != j:
                    change_ovalue = applyTranspositionQAP(perm, i, j, weights, distances)
                    evals+=1
                    if change_ovalue < 0:
                        perm[i], perm[j] = exchange(perm[i], perm[j])
                        bits[j] = 0
                        return change_ovalue, evals
                    if evals == max_evals:
                        return 0, evals
            bits[i] = False
    return 0, evals

@jit(types.UniTuple(int64,2)(int64[:], int64, boolean[:], int64, int64, int64, int64[:,:], int64[:,:]),
     cache=True, nopython=True)
def improveSolution(perm, ovalue, bits, ls_type, evals, max_evals, weights, distances):
    if ls_type == 0:
        diff, evals = improveSolution2opt(perm, evals, max_evals, weights, distances)
    elif ls_type == 1:
        diff, evals = improveSolution2optBits(perm, evals, max_evals, bits, weights, distances)
    return ovalue+diff, evals

@jit(types.UniTuple(int64,2)(int64[:], int64, int64, int64, int64[:,:], int64[:,:]),
     cache=True, nopython=True)
def numbaLocalSearch(perm, ovalue, ls_type, max_evals, weights, distances):
    evals = 0
    improved = True
    bits = np.ones(len(perm), dtype = np.bool_)
    while improved:
        novalue, evals = improveSolution(perm, ovalue, bits, ls_type, evals, max_evals, weights, distances)
        while novalue < ovalue and (max_evals == -1 or evals < max_evals):
            ovalue = novalue
            novalue, evals = improveSolution(perm, ovalue, bits, ls_type, evals, max_evals,
                                             weights, distances)
        if ls_type == 1:
            bits = np.ones(len(perm), dtype = np.bool_)
            novalue, evals = improveSolution(perm, ovalue, bits, 1, evals, max_evals,
                                             weights, distances)
        if novalue < ovalue and (max_evals == -1 or evals < max_evals):
            ovalue = novalue
        else:
            improved = False

    return novalue, evals

class LocalSearch:

    def localSearch(solution, ls_type, max_evals = -1):

        if ls_type == LSType['sa']:
            evals = SA.SALS(solution, max_evals if max_evals > 0 else 10*solution.problem.N*solution.problem.N)
        elif ls_type != LSType['none']:
            solution.ovalue, evals = numbaLocalSearch(solution.perm,
                                           solution.getObjectiveValue(),
                                           int(codeLS(ls_type)),
                                           max_evals,
                                           solution.problem.weights,
                                           solution.problem.distances)
        else:
            evals = 0
        return evals
