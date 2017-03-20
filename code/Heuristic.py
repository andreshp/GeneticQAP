#########################################################################
# Author: Andrés Herrera Poyatos
# Date: April, 2017
# Abstract class for heuristics.
#########################################################################

import Timer
from enum import Enum
import csv

import AbstractSolution

class Execution(Enum):
    fixed_time = 1
    iterations = 2
    convergence = 3

class Heuristic:

    """Abstract class that serve as a general interfaces for the
    heuristics implemented as subclases.
    """    

    def __init__(self, problem):
        self.problem = problem
        self.next_point_to_image_time = 0.001
        
    def generateSolution(max_executing_time = 0, etype = 1):
        """Generate a new solution with the heuristic code.
        - max_executing_time: float Time data for the execution.
        - etype: Type of the execution. It is an Execution enum.
        
        The method is implemented calling the virtual methods iteration
        and initialComputations.
        """

        executing_time = max_executing_time
        iterations = 0
        ovalues = []
        self.best_sol = None

        # Starts the timer.
        timer = Timer()
        timer.start()

        # Makes the heuristic's initial computations.
        initialComputations1()
        # Adds the initial points.    
        if (executing_time > 0 and etype!=Execution.iterations) or (etype==Execution.iterations and num_iterations>0):
            ovalues.append(self.best_sol.getObjectiveValue())
            timer.save()
            
        # Make second computations of the heuristic and take measures if needed.
        initialComputations2()
        # Get the points for the images.
        if timer.getTime() >= next_point_to_image_time:
            next_point_to_image_time += 0.001
            ovalues.append(self.best_sol.getObjectiveValue())
            timer.save()
        
        # Keep iterating while there is time or iterations left.
        while (timer.getTime() < executing_time and etype != Execution.iterations) or (etype==Execution.iterations and iterations < num_iterations):
            iteration()
            iterations+=1
            # Get the points for the images.
            if timer.getTime() >= next_point_to_image_time:
                next_point_to_image_time += 0.001
                ovalues.append(self.best_sol.getObjectiveValue())
                timer.save()

            # If the execution is of etype 2, then the execution time is updated when needed.
            # That is, if the new solution is better than the last one.
            if etype == Execution.convergence and ovalue[-1] < ovalue[-2]:
                executing_time = max_executing_time + timer.getTime()
 
        # Do the final computations.
        finalComputations()
        if etype == Execution.iterations:
            executing_time = timer.getTime()
            ovalues.append(self.best_sol.getObjectiveValue())


        image_data_file = "objective_value.csv"

        with open(image_data_file, 'w') as f:
            writer = csv.writer(f, delimiter=',')
            writer.writerows(zip(timer.record(),ovalues))

    return best_sol

