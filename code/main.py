#########################################################################
# Author: Andrés Herrera Poyatos
# Date: April, 2017
# Main file of the QAP project.
#########################################################################

import random
import argparse

from Solution import *
from QAP import *
from Greedy import *
from Timer import *
from LocalSearch import *
from GeneticAlgorithm import *

if __name__ == "__main__":

    parser = argparse.ArgumentParser(description='Evolutionary computation on QAP.')
    parser.add_argument('instance', metavar='-i', type=str, help='Instance to execute.')
    parser.add_argument('algorithm', metavar='-a', type=str, help='Algorithm to use. Options: gga, greedy')
    parser.add_argument('execution', metavar='-e', type=str, help='Type of execution. Options: t, i, c')
    parser.add_argument('exe_parameter', metavar='-ep', type=int, help='Execution parameter.')
    parser.add_argument('--ps', type=int, help='Population size.')

    args = parser.parse_args()
    #random.seed(28)

    # Initializes the problem.
    problem = QAP(args.instance)

    # Chooses the execution type.
    if args.execution == 't':
        etype = Execution.fixed_time
    elif args.execution == 'c':
        etype = Execution.convergence
    else:
        etype = Execution.iterations

    # Initializes the execution parameters.
    num_iterations = 0
    exe_time = 0
    if etype == Execution.iterations:
        num_iterations = args.exe_parameter
    else:
        exe_time = args.exe_parameter

    pop_size = -1
    if args.ps != None:
        pop_size = args.ps
        
    if args.algorithm == 'gga':
        with Timer() as t:
            gen = GGA(problem, pop_size=pop_size)
            s = gen.generateSolution(exe_time,num_iterations,etype)
            s.fullPrint()
        print("Time (s):", t.secs)
    else:
        with Timer() as t:
            g = GreedyQAP(problem)
            g.buildSolution().fullPrint()
        print("Time (s):", t.secs)

    """
    print("Random solution:")
    with Timer() as t:
        sol = Solution(problem, True, None)
        sol.fullPrint()
    print("Time (s):", t.secs)
    
    print("Greedy-QAP solution:")
    with Timer() as t:
        g = GreedyQAP(problem)
        g.buildSolution().fullPrint()
    print("Time (s):", t.secs)


    print("ProperGreedy solution:")
    with Timer() as t:
        pg = ProperGreedy(problem)
        s = pg.buildSolution()
        s.fullPrint()
    print("Time (s):", t.secs)

    print("Local search on ProperGreedy solution:")
    with Timer() as t:
        LocalSearch.localSearch(s, LSType['2opt'])
        s.fullPrint()
        #print(LocalSearch.applyTransposition(s.perm, 0, 2, problem.weights, problem.distances))
    print("Time (s):", t.secs)

    s2 = pg.buildSolution()
    
    print("Local search with bits on ProperGreedy solution:")
    with Timer() as t:
        LocalSearch.localSearch(s2, LSType['2opt_bits'])
        s2.fullPrint()
        #print(LocalSearch.applyTransposition(s.perm, 0, 2, problem.weights, problem.distances))
    print("Time (s):", t.secs)


    print("Genetic algorithm solution:")
    with Timer() as t:
        gen = GGA(problem, pop_size=60)
        s = gen.generateSolution(num_iterations = 100, etype = Execution.iterations)
        s.fullPrint()
    print("Time (s):", t.secs)
    """
