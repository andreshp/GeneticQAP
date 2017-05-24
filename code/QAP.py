#########################################################################
# Author: Andrés Herrera Poyatos
# Date: April, 2017
# Class which represents an instance of the QAP problem.
#########################################################################

import os
import numpy as np

from AbstractProblem import *

class QAP(AbstractProblem):

    def __init__(self, fname):
        """Saves the name of the input file and calls the parse file funcion."""
        super().__init__(fname)

    def parseFile(self, fname):
        """Parses the input file with the problem instance.
        First we read the problem size (N). Afterwards we read the weights 
        and the distances of the problem.
        """
        f = open(fname)
        self.N = int(f.readline())

        last_pos = f.tell()
        row = f.readline()
        i = 0
        while len(row) < self.N and i < 10:
            last_pos = f.tell()
            row = f.readline()
            i+=1
        f.seek(last_pos)
            
        self.weights = np.array([list(map(int, f.readline().split())) for i in range(0,self.N)], dtype = np.int64)

        last_pos = f.tell()
        row = f.readline()
        while len(row) < self.N:
            last_pos = f.tell()
            row = f.readline()
        f.seek(last_pos)

        self.distances = np.array([list(map(int, f.readline().split())) for i in range(0,self.N)], dtype = np.int64)
        
    
