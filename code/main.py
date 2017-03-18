#########################################################################
# Author: Andrés Herrera Poyatos
# Date: April, 2017
# Main file of the QAP project.
#########################################################################

import random
import argparse
from Solution import *
from Problem import *

if __name__ == "__main__":

    parser = argparse.ArgumentParser(description='Evolutionary computation on QAP.')
    parser.add_argument('instance', metavar='-i', type=str, help='Instance to execute')

    args = parser.parse_args()
    print(args)
    random.seed(28)

    problem = QAP(args.instance)
    sol = Solution(problem)
    sol.fullPrint()
