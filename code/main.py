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
from GeneticAlgorithm import *
from GRASP import *
from Aux import *

if __name__ == "__main__":

    parser = argparse.ArgumentParser(description='Evolutionary computation on QAP.')
    parser.add_argument('instance', metavar='-i', type=str, help='Instance to execute.')
    parser.add_argument('algorithm', metavar='-a', type=str, help='Algorithm to use. Options: gga, sga, greedy1, greedy2')
    parser.add_argument('execution', metavar='-e', type=str, help='Type of execution. Options: t, i, e, c')
    parser.add_argument('exe_parameter', metavar='-ep', type=int, help='Execution parameter.')
    parser.add_argument('-ps', '--population_size', type=int, help='Population size.')
    parser.add_argument('-pc', '--prob_cross', type=float, help='Crossover probability. It is 0.7 by default.')
    parser.add_argument('-pm', '--prob_mut', type=float, help='Mutation probability. It is 0.1 by default.')
    parser.add_argument('-c', '--cross', type=str, help='Crossover used in GAs. Options: Position, PMX, OX (Default: Position)')
    parser.add_argument('-v', '--verbose', action='store_true', help='Verbose execution.')
    parser.add_argument('-csv', '--csv', action='store_true', help='Saves some csv with the algorithm data for making plots.')
    parser.add_argument('-ls', '--local_search', type=str, help='Local search used. Options: 2opt, 2optb. (Default: 2opt)')
    parser.add_argument('-itpls', '--itpls', type=int, help='Number of iterations per local search application.')
    parser.add_argument('-lsga', '--lsga', type=str, help='Hybridization of GAs and local search. Options: None, All, Random, Best. (Default: None)')
    parser.add_argument('-lsp', '--ls_proportion', type=float, help='Proportion of the population improved by the local search.')
    parser.add_argument('-lsme', '--ls_max_evals', type=float, help='Maximum number of evaluations used by the local search. By the default there is no upper limit in the number of evaluations.')
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

    # Population size
    pop_size = -1 if args.population_size == None else args.population_size
    # Crossover probability
    prob_cross = -1 if args.prob_cross == None else args.prob_cross
    # Mutation probability
    prob_mut = -1 if args.prob_mut == None else args.prob_mut
    
    # Takes the crossover argument.
    crossover = CrossType['Position'] if args.cross == None else CrossType[args.cross]

    # Takes the LS arguments.
    ls = LSType['2opt'] if args.local_search == None else LSType[args.local_search]
    itpls = 1 if args.itpls == None else args.itpls
    lsga = TypeLSGA['None'] if args.lsga == None else TypeLSGA[args.lsga]
    ls_proportion = 0 if args.ls_proportion == None else args.ls_proportion
    ls_max_evals = -1 if args.ls_max_evals == None else args.ls_max_evals
    hls = HybridizationLSGA(ls, itpls, lsga, ls_proportion, ls_max_evals)
    
    if args.algorithm == 'gga':
        gga = GGA(problem, args.verbose, pop_size=pop_size, crossover=crossover, hybrid_ls = hls, cross_prob=prob_cross, mut_prob=prob_mut)
        s = gga.generateSolution(exe_time, num_iterations, num_evaluations, etype, csv = args.csv)
        s.fullPrint()
    elif args.algorithm == 'sga':
        sga = SGA(problem, args.verbose, pop_size=pop_size, crossover=crossover, hybrid_ls = hls,
                  mut_prob = prob_mut)
        s = sga.generateSolution(exe_time, num_iterations, num_evaluations, etype, csv = args.csv)
        s.fullPrint()
    elif args.algorithm == 'greedy1':
        g = GreedyQAP(problem)
        grasp = GRASP(problem, g, args.verbose, ls, ls_max_evals)
        grasp.generateSolution(0, 0, 0, etype, csv = args.csv).fullPrint()
    elif args.algorithm == 'greedy2':
        g = ProperGreedy(problem)
        grasp = GRASP(problem, g, args.verbose, local_search = ls, ls_max_evals=ls_max_evals)
        grasp.generateSolution(0, 0, 0, etype, csv = args.csv).fullPrint()
