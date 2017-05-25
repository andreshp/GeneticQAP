#########################################################################
# Author: Andrés Herrera Poyatos
# Date: April, 2017
# Main file of the QAP project.
#########################################################################

import random
import argparse
import numpy as np

from Solution import *
from QAP import *
from Greedy import *
from Timer import *
from LocalSearch import *
from ILS import *
from GRASP import *
from Aux import *

if __name__ == "__main__":

    parser = argparse.ArgumentParser(description='Multi-start heuristics for QAP.')
    parser.add_argument('instance', metavar='-i', type=str, help='Instance to execute.')
    parser.add_argument('algorithm', metavar='-a', type=str, help='Algorithm to use. Options: ils, grasp, greedy1, greedy2')
    parser.add_argument('execution', metavar='-e', type=str, help='Type of execution. Options: t, i, e, c')
    parser.add_argument('exe_parameter', metavar='-ep', type=int, help='Execution parameter.')
    parser.add_argument('-v', '--verbose', action='store_true', help='Verbose execution.')
    parser.add_argument('-csvf', '--csv_folder', type=str, help='Directory where saving some csv with the algorithm data for making plots. Default: None (no csv is saved).')
    parser.add_argument('-csvs', '--csv_suffix', type=str, help='Suffix appended to the name of the csv files. Default: None (no suffix). Example: csv_folder = /tmp, csv_suffix = ils. The csv is saved as "/tmp/objective_value_ils.csv".')
    parser.add_argument('-ls', '--local_search', type=str, help='Local search used. Options: 2opt, 2optb, sa, none. (Default: 2opt)')
    parser.add_argument('-gr', '--greedy', type=str, help='Greedy algorithm used in GRASP. Options: ind, pairs. (Default: ind)')
    parser.add_argument('-gra', '--greedy_alpha', type=float, help='Parameter used for building the lrc in randomized greedy algorithms. (Default: 0.05)')
    parser.add_argument('-lsme', '--ls_max_evals', type=float, help='Maximum number of evaluations used by the local search. By the default there is no upper limit in the number of evaluations.')
    parser.add_argument('-mp', '--mut_prop', type=float, help='Proportion of the solution which is mutated in an ILS iteration. Default: 0.25')
    parser.add_argument('-ft', '--final_temp', type=float, help='Final temperature of simulated annealing. If the value is negative, then the final temperature is its absolute value times the original solution objective value. Otherwise, the final temperature is the given value.')
    parser.add_argument('-seed', '--seed', type=int, help='Seed for random numbers generation.')
    
    args = parser.parse_args()

    # Set the seed
    if args.seed != None:
        random.seed(args.seed)
        np.random.seed(args.seed)
        setSeed(args.seed)

    # Initializes the problem.
    problem = QAP(args.instance)

    # Chooses the execution type.
    if args.execution == 't':
        etype = Execution.fixed_time
    elif args.execution == 'c':
        etype = Execution.convergence
    elif args.execution == 'e':
        etype = Execution.fixed_evaluations
    else:
        etype = Execution.iterations

    # Initializes the execution parameters.
    num_iterations = 0
    exe_time = 0
    num_evaluations = 0
    if etype == Execution.iterations:
        num_iterations = args.exe_parameter
    elif etype == Execution.fixed_evaluations:
        num_evaluations = args.exe_parameter
    else:
        exe_time = args.exe_parameter

    # Takes the LS arguments.
    ls = LSType['2opt'] if args.local_search == None else LSType[args.local_search]
    ls_max_evals = -1 if args.ls_max_evals == None else args.ls_max_evals

    # Takes the ILS arguments.
    mut_prop = -1 if args.mut_prop == None else args.mut_prop

    # Takes the GRASP arguments.
    greedy = 'ind' if args.greedy == None else args.greedy
    greedy_alpha = 0.05 if args.greedy_alpha == None else args.greedy_alpha

    # Takes the SA arguments.
    final_temp = -0.001 if args.final_temp == None else args.final_temp

    if args.algorithm == 'ils':
        ils = ILS(problem, verbose = args.verbose, local_search=ls, ls_max_evals=ls_max_evals, mut_prop=mut_prop)
        s = ils.generateSolution(exe_time, num_iterations, num_evaluations, etype, csvf = args.csv_folder, csvs = args.csv_suffix)
        s.fullPrint()
    elif args.algorithm == 'sa':
        sa = SA(problem, verbose = args.verbose, final_temp = final_temp)
        s = sa.generateSolution(exe_time, num_iterations, num_evaluations, etype, csvf = args.csv_folder, csvs = args.csv_suffix)
        s.fullPrint()
    elif args.algorithm == 'grasp':
        if greedy == 'ind':
            g = RandomizedIndividualGreedy(problem, greedy_alpha)
        else:
            g = RandomizedPairsGreedy(problem, greedy_alpha)
        grasp = GRASP(problem, g, args.verbose, ls, ls_max_evals)
        s = grasp.generateSolution(exe_time, num_iterations, num_evaluations, etype, csvf = args.csv_folder, csvs = args.csv_suffix)
        s.fullPrint()
    elif args.algorithm == 'greedy':
        g = GreedyQAP(problem)
        grasp = GRASP(problem, g, args.verbose, ls, ls_max_evals)
        grasp.generateSolution(0, 0, 0, etype, csvf = args.csv_folder, csvs = args.csv_suffix).fullPrint()
