#########################################################################
# Author: Andrés Herrera Poyatos
# Date: April, 2017
# Auxiliar functions for the implementation.
#########################################################################

import numpy as np
from numba import jit, int64, void, types          # import the decorator
import random

@jit(types.UniTuple(int64,2)(int64,int64), cache=True, nopython=True)
def exchange(a, b):
    return b, a

@jit(int64[:](int64[:]))
def put0First(perm):
    p=np.where(perm == 0)[0][0]
    return np.concatenate([perm[p:], perm[0:p]])

@jit(void(int64), cache=True, nopython=True)
def setSeed(seed):
    random.seed(seed)
    np.random.seed(seed)
