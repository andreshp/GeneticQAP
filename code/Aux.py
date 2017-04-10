#########################################################################
# Author: Andrés Herrera Poyatos
# Date: April, 2017
# Auxiliar functions for the implementation.
#########################################################################

import numpy as np
from numba import jit, int64, void          # import the decorator

@jit(int64[:](int64,int64))
def exchange(a, b):
    return b, a

@jit(int64[:](int64[:]))
def put0First(perm):
    p=np.where(perm == 0)[0][0]
    return np.concatenate([perm[p:], perm[0:p]])

