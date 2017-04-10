#########################################################################
# Author: Andrés Herrera Poyatos
# Date: April, 2017
# Abstract class for optimization problems.
#########################################################################

import os
import numpy as np

class AbstractProblem:

    """
    Class which represents an abstract problem.
    A problem has two essential methods:
    - The init method, which is passed a file's name which has the problem information.
      The file and the problem names are saved. Then it calls to the parseFile method to
      obtain the problem information.
    - The parseFile method, which reads the problem information from the given file.
      It must be implemented for each problem.
    """
    
    def __init__(self, fname):
        """Saves the name of the input file and calls the parse file funcion."""
        self.parseFile(fname)
        self.fname = fname.replace('.dat', '')
        self.fname = self.fname.replace('./instances/', '')

    def parseFile(self, fname):
        """Parses the input file with the problem instance. Needs to be implemented for each problem."""
        raise NotImplementedError
