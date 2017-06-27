#########################################################################
# Author: Andrés Herrera Poyatos
# Date: April, 2017
# Abstract class for heuristics.
#########################################################################

from enum import Enum
import csv
import os

from Timer import *

import AbstractSolution

Execution = Enum('Execution', 'fixed_time iterations fixed_evaluations convergence')

class Heuristic:

    """Abstract class that serve as a general interfaces for the
    heuristics implemented as subclase
    """    

    def __init__(self, problem, verbose = False, print_aux_info = False):
        # Problem which the heuristic solves
        self.problem = problem
        # Time between two consecutive points in an image.
        self.next_point_to_image_time = 0
        # If verbose = True, then the heuristic prints information about the best solution.
        self.verbose = verbose
        # Number of solutions evaluated in the execution.
        self.num_evaluations = 0
        # Current iteration in the heuristic.
        self.current_it = 0
        # Name of the auxiliar info saved to csv.
        self.aux_info_name = "not defined"
        
        # Boolean which determines whether auxiliar information about the execution is printed or not.
        self.print_aux_info = print_aux_info
        # Number of local search applications in the computations.
        # It is only updated by those heuristics which use the local search.
        self.num_ls = 0
        # Number of greedy solutions generated in the heuristic.
        # It is only updated in those heuristics which use greedy solution underneath.
        self.num_greedy = 0
        # Number of children that reemplaced their parents in GADEGD.
        self.num_reemplacements = 0

    def initialComputations1(self):
        raise NotImplementedError

    def initialComputations2(self):
        pass

    def iteration(self):
        pass

    def finalComputations(self):
        pass

    def saveValueCSV(self):
        self.next_point_to_image_time += 0.001
        self.plot_ovalues.append(self.best_sol.getObjectiveValue())
        self.timer.save()
        self.saveAuxCSV()

    def saveCSV(self, image_data_folder, suffix):
        suffix = "" if suffix == None else "_"+suffix
        image_data_file = os.path.join(image_data_folder, "objective_value"+ suffix + ".csv")
        with open(image_data_file, 'w') as f:
            writer = csv.writer(f, delimiter=',')
            writer.writerows([("Time", "Objective value")])
            writer.writerows(zip(self.timer.record(), self.plot_ovalues))
        if len(self.aux_info) > 0:
            image_data_file2 = os.path.join(image_data_folder, self.aux_info_name.lower()+ suffix + ".csv")
            with open(image_data_file2, 'w') as f:
                writer = csv.writer(f, delimiter=',')
                writer.writerows([("Time", self.aux_info_name)])
                writer.writerows(zip(self.timer.record(), self.aux_info))

    def saveAuxCSV(self):
        pass

    def saveExecutionInformation(self, max_executing_time, total_num_iterations, total_num_evaluations, etype):
        pass

    def generateSolution(self, max_executing_time = 0, total_num_iterations = 0,
                         total_num_evaluations = 0, etype = 1, csvf = None, csvs = None):
        """Generate a new solution with the heuristic code.
        - max_executing_time: float Time data for the execution.
        - etype: Type of the execution. It is an Execution enum.
        
        The method is implemented calling the virtual methods iteration
        and initialComputations.
        """

        executing_time = max_executing_time
        self.current_it = 0
        self.num_evaluations = 0
        self.next_point_to_image_time = 0
        self.plot_ovalues = []
        self.aux_info = []
        self.best_sol = None

        # Saves the execution information if needed.
        self.saveExecutionInformation(max_executing_time, total_num_iterations, total_num_evaluations, etype)

        # Starts the self.timer.
        self.timer = Timer()
        self.timer.start()

        # Makes the heuristic's initial computations.
        self.initialComputations1()
        if self.verbose:
            print(" - Initial computations. Number of evaluations", self.num_evaluations, ".", self.best_sol)
        
        if ((executing_time > 0 and etype != Execution.iterations and etype != Execution.fixed_evaluations) or
            (etype == Execution.iterations and total_num_iterations > 0) or
            (etype == Execution.fixed_evaluations and total_num_evaluations > 0)):

            # Adds the initial points.
            self.saveValueCSV()
            
            # Make second computations of the heuristic and take measures if needed.
            self.initialComputations2()
            # Get the points for the images.
            if self.timer.getTime() >= self.next_point_to_image_time:
                self.saveValueCSV()

            ovalue = self.best_sol.getObjectiveValue()
                
            # Keep iterating while there is time or iterations left.
            while ((etype != Execution.iterations and etype != Execution.fixed_evaluations and
                    self.timer.getTime() < executing_time) or
                   (etype == Execution.iterations and self.current_it < total_num_iterations) or
                   (etype == Execution.fixed_evaluations and self.num_evaluations < total_num_evaluations)):

                self.iteration()
                self.current_it+=1
                if self.verbose:
                    print(" - Iteration " + str(self.current_it) + ". Number of evaluations " +
                          str(self.num_evaluations) + ".", self.best_sol)

                # Get the points for the images.
                if self.timer.getTime() >= self.next_point_to_image_time:
                    self.saveValueCSV()
                    
                # If the execution is of etype convergence, then the execution time
                # is updated when needed.
                # That is, if the new solution is better than the last one.
                if etype == Execution.convergence and self.best_sol.getObjectiveValue() < ovalue:
                    executing_time = max_executing_time + self.timer.getTime()
                    ovalue = self.best_sol.getObjectiveValue()

        # Do the final computations.
        self.finalComputations()
        self.saveValueCSV()

        print("Time (s):", self.timer.getTime())
        print("Number of evaluations:", self.num_evaluations)
        print("Number of iterations:", self.current_it)
        if self.print_aux_info:
            print("Number of local search applications:", self.num_ls)
            print("Number of greedy solutions:", self.num_greedy)
            print("Number of reemplacements in GADEGD:", self.num_reemplacements)

        if csvf != None:
            self.saveCSV(csvf, csvs)

        return self.best_sol

    def generateSolutions(self, num_sols, executing_time = 0):
        return [self.generateSolution(executing_time) for i in range(0, num_sols)]
  
