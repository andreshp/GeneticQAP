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

if __name__ == "__main__":

    parser = argparse.ArgumentParser(description='Evolutionary computation on QAP.')
    parser.add_argument('instance', metavar='-i', type=str, help='Instance to execute')

    args = parser.parse_args()
    #random.seed(28)

    problem = QAP(args.instance)
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
        pg.buildSolution().fullPrint()
    print("Time (s):", t.secs)
