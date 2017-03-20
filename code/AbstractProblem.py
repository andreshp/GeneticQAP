#########################################################################
# Author: Andrés Herrera Poyatos
# Date: April, 2017
# Abstract class for optimization problems.
#########################################################################

import os
import numpy as np

class AbstractProblem:

    def __init__(self, fname):
        """Saves the name of the input file and calls the parse file funcion."""
        self.parseFile(fname)
        self.fname = fname.replace('.dat', '')
        self.fname = self.fname.replace('./instances/', '')

    def parseFile(self, fname):
        """Parses the input file with the problem instance. Needs to be implemented for each problem."""
        raise NotImplementedError
