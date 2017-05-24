#########################################################################
# Author: Andrés Herrera Poyatos
# Date: April, 2017
# Abstract solution class for optimization problems.
#########################################################################

import random

class AbstractSolution:

    """
    Class which represents an abstract solution.
    A solution has five essential methods:
    - The init method, where the solution data is initialized. 
      It calls the initializeData method.
    - The initializeData method, where the solution is fully initialized.
      It must be implemented for each problem.
    - The getObjectiveValue method, which return the solution's objective
      value.
    - The computeObjectiveValue method, which computes the solution's objective 
      value and must be implemented for each problem.
    - The fullPrint method, which prints the whole solution. It must also be
      implemented for each problem.
    """

    def __init__(self, problem, random = True, structure = None):
        """ Initializes an abstract solution from the problem. 
        The solution general data is initialized by default.
        Then it calls the initializeData method.
        """

        # Problem which attempts to solve the solution.
        self.problem = problem
        # Solution objective value. It is -1 by default.
        self.ovalue = -1
        # Tells whether the solution is valid or not.
        self.is_valid = False
        # Algorithm used to build the solution.
        self.algorithm = None
        self.initializeData(problem, random, structure)
        
    def initializeData(self, problem, random, structure):
        """ Initializes an abstract solution data from the problem.
        If structure is not None, then the solution's structure is taken 
        from this parameter. Otherwise if random = True, then the solution 
        is randomly built and if random = False, then the solution is not
        constructed and it is initialized by default.
        It must be implemented for each problem.
        """
        raise NotImplementedError

    def getObjectiveValue(self):
        """ Gets the solution objective value, which is taken from
        the ovalue attribute. If it is -1 and the solution is valid,
        then the real objective value is computed by the 
        computeObjectiveValue method.
        """
        if self.is_valid:
            if self.ovalue == -1:
                return self.computeObjectiveValue()
            else:
                return self.ovalue
        else:
            return -1

    def computeObjectiveValue(self):
        """Computes the solution objective value.
        It must be implemented for each problem.
        """
        raise NotImplementedError

    def fullPrint(self):
        """ Prints the solution information completely.
        It must be implemented for each problem.
        """
        raise NotImplementedError

    def __str__(self):
        return "Objective value: " + str(self.getObjectiveValue())
    
    def __gt__(self, s2):
        """A solution is better than other solution if it has less objective value."""
        return self.getObjectiveValue() < s2.getObjectiveValue()

    def __ge__(self, s2):
        """A solution is better than other solution if it has less objective value."""
        return self.getObjectiveValue() <= s2.getObjectiveValue()

    def __lt__(self, s2):
        """A solution is better than other solution if it has less objective value."""
        return self.getObjectiveValue() > s2.getObjectiveValue()

    def __le__(self, s2):
        """A solution is better than other solution if it has less objective value."""
        return self.getObjectiveValue() >= s2.getObjectiveValue()
