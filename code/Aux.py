#########################################################################
# Author: Andrés Herrera Poyatos
# Date: April, 2017
# Auxiliar functions for the implementation.
#########################################################################

import numpy as np
from numba import jit, int64, void, types          # import the decorator
import random
import os

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

def execute(parameters, sol_dir, suffix, num_executions, server):
    os.makedirs(sol_dir, exist_ok = True)
    for i in range(1, num_executions+1):
        command = " ".join([parameters,"-seed", str(i)])
        if server:
            os.system(" ".join(["bash", "./scripts/execute_instance.sh", sol_dir, str(i), command,  "-csvf /tmp", "-csvs", suffix+"_"+str(i)]))
        else:
            sol = sol_dir + "/"+str(i)+".sol"
            os.system(" ".join([command, "-csvf", sol_dir, "-csvs", str(i), ">", sol]))

def argsort(seq):
    #http://stackoverflow.com/questions/3071415/efficient-method-to-calculate-the-rank-vector-of-a-list-in-python
    return sorted(range(len(seq)), key=seq.__getitem__)
