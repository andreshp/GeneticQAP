#########################################################################
# Author: Andrés Herrera Poyatos
# Date: April, 2017
# Abstract class for heuristics.
#########################################################################

from enum import Enum
import csv

from Timer import *

import AbstractSolution

Execution = Enum('Execution', 'fixed_time iterations convergence')

class Heuristic:

    """Abstract class that serve as a general interfaces for the
    heuristics implemented as subclase
    """    

    def __init__(self, problem):
        self.problem = problem
        self.next_point_to_image_time = 0.001

    def initialComputations1(self):
        raise NotImplementedError

    def initialComputations2(self):
        pass

    def iteration(self):
        pass

    def finalComputations(self):
        pass

    def generateSolution(self, max_executing_time = 0, num_iterations = 0, etype = 1):
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
        self.initialComputations1()

        if (executing_time > 0 and etype != Execution.iterations) or (etype == Execution.iterations and num_iterations > 0):

            # Adds the initial points.    
            ovalues.append(self.best_sol.getObjectiveValue())
            timer.save()
            
            # Make second computations of the heuristic and take measures if needed.
            self.initialComputations2()
            # Get the points for the images.
            if timer.getTime() >= self.next_point_to_image_time:
                self.next_point_to_image_time += 0.001
                ovalues.append(self.best_sol.getObjectiveValue())
                timer.save()
        
            # Keep iterating while there is time or iterations left.
            while (etype != Execution.iterations and timer.getTime() < executing_time) or (etype == Execution.iterations and iterations < num_iterations):
                self.iteration()
                iterations+=1
                # Get the points for the images.
                if timer.getTime() >= self.next_point_to_image_time:
                    self.next_point_to_image_time += 0.001
                    ovalues.append(self.best_sol.getObjectiveValue())
                    timer.save()

                # If the execution is of etype convergence, then the execution time
                # is updated when needed.
                # That is, if the new solution is better than the last one.
                if etype == Execution.convergence and ovalue[-1] < ovalue[-2]:
                    executing_time = max_executing_time + timer.getTime()
 
            # Do the final computations.
            self.finalComputations()
            if etype == Execution.iterations:
                executing_time = timer.getTime()
                ovalues.append(self.best_sol.getObjectiveValue())

            image_data_file = "objective_value.csv"
            with open(image_data_file, 'w') as f:
                writer = csv.writer(f, delimiter=',')
                writer.writerows(zip(timer.record(), ovalues))

        return self.best_sol

    def generateSolutions(self, num_sols, executing_time = 0):
        return [self.generateSolution(executing_time) for i in range(0, num_sols)]

