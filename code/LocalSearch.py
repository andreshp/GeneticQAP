#########################################################################
# Author: Andrés Herrera Poyatos
# Date: April, 2017
# LocalSearch algorithms for QAP.
#########################################################################


class LSType(Enum):
    2opt = 0
    2opt_bits = 1

    
class LocalSearch:

    def localSearch(solution, ls_type):
        ovalue = solution.getObjectiveValue()
        perm = solution.perm
        numbaLocalSearch(perm, ovalue)

    def numbaLocalSearch(perm, ovalue):
        novalue = improveSolution(perm, ovalue)
        while novalue < ovalue:
            ovalue = value
            novalue = improveSolution(perm, ovalue, ls_type)

    def improveSolution(perm, ovalue, ls_type):
        if ls_type == 2opt or ls_type == 2opt_bits:
            improveSolution2opt(perm, ovalue, ls_type == 2opt_bits)

    def improveSolution2opt(perm, ovalue, with_bits):

        for i in range(0, len(perm)):
            for j in range(0, len(perm))
