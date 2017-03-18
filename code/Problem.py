#########################################################################
# Author: Andrés Herrera Poyatos
# Date: April, 2017
# Abstract class for optimization problems.
#########################################################################

import os
import numpy as np

class AbstractProblem:

    # Saves the name of the input file and calls the parse file funcion.
    def __init__(self, fname):
        self.parseFile(fname)
        self.fname = fname.replace('.dat', '')
        self.fname = fname.replace('./instances/', '')
    
    # Parses the input file with the problem instance. Needs to be implemented for each problem.
    def parseFile(self, fname):
        raise NotImplementedError


class QAP(AbstractProblem):

    # Saves the name of the input file and calls the parse file funcion.
    def __init__(self, fname):
        super().__init__(fname)

    # Parses the input file with the problem instance.
    def parseFile(self, fname):
        f = open(fname)
        self.N = int(f.readline())
        f.readline()
        self.weights = np.matrix([list(map(int, f.readline().split())) for i in range(0,self.N)])
        f.readline()
        self.distances = np.matrix([list(map(int, f.readline().split())) for i in range(0,self.N)])
        
    
