#########################################################################
# Author: Andrés Herrera Poyatos
# Date: May, 2017
# Simulated annealing implementation.
#########################################################################

from Heuristic import *
from Solution import *
import copy
import math

class SA(Heuristic):

    def __init__(self, problem, verbose = False, solution = None, final_temp = -0.001):
        super().__init__(problem, verbose)
        # Maximum number of changes accepted per iteration.
        self.changes_per_it = self.problem.N
        # Maximum number of neighbours visited per iteration
        self.neighbours_per_it = 10*self.problem.N # Try 1.5, which I used before
        # In the first iteration the probability of accepting a solution worst that the
        # original one is prob_accept^{percent_accept * costs_difference / best_sol.getObjectiveValue()}
        self.prob_accept = 0.3
        self.percent_accept = 0.3
        # Total number of iterations.
        self.total_iterations = -1
        # Initial solution.
        self.sol = Solution(problem) if solution == None else solution
        # Final temperature of the model. There are two possibilities:
        # fixed final temp (the argument final_temp is positive) or proportional to
        # the original solution cost (the argument final_temp is negative).
        self.final_temp = final_temp if final_temp > 0 else -final_temp*self.sol.getObjectiveValue()

    def saveExecutionInformation(self, max_executing_time, total_iterations, total_num_evaluations, etype):
        if etype == Execution.fixed_evaluations:
            self.total_iterations = total_num_evaluations // (self.neighbours_per_it)
        elif etype == Execution.iterations:
            self.total_iterations = total_iterations
        elif etype == Execution.fixed_time:
            self.total_iterations = max_executing_time*(300000) // (self.neighbours_per_it)
        else:
            self.total_iterations = 1000000
        if self.total_iterations == 0:
            self.total_iterations += 1
            
    def initialComputations1(self):
        """Find an initial solution."""
        # The initial temperature verifies exp(-K/T_0) = prob_accept^{percent_accept * K / sol.getObjectiveValue()} 
        self.temp = (self.percent_accept/(-math.log(self.prob_accept))) * self.sol.getObjectiveValue()
        # The cooling rate is chosen in order to make exactly total_iterations iterations.
        # See how the temperature is updated in updateTemparature.
        self.cooling_rate = (self.temp - self.final_temp)/(self.total_iterations * self.temp * self.final_temp)
        # Current solution of the algorithm. It changes over and over.
        self.best_sol = copy.deepcopy(self.sol)

    def updateTemparature(self):
        """ Updates the temperature using a Cauchy scheme:
            T_{k+1} = T_k / (1 + cooling_rate * T_k).
            Solving this recurrence one gets T_k = 1 / (cooling_rate * k + 1/T_0).
            When k = total_iterations we obtain T_k = final_temp.
        """
        self.temp = newTemperature(self.temp, self.cooling_rate)#self.temp / (1 + self.cooling_rate * self.temp)
        
    def iteration(self):
        """Visits some random neighbours, accepting any of them which improves the solution and some of 
           the other ones under a temperature and objective value depending probability.
        """

        best_perm_diff = self.sol.getObjectiveValue()- self.best_sol.getObjectiveValue()
        best_ovalue, ovalue, evals = improveSolutionSA(self.sol.perm, self.best_sol.perm,
                                                                  best_perm_diff,
                                                                  self.neighbours_per_it, self.changes_per_it,
                                                                  self.temp, self.problem.weights, self.problem.distances)
        if best_ovalue > best_perm_diff:
            self.best_sol.ovalue = self.sol.ovalue - best_ovalue

        self.sol.ovalue += ovalue
        self.num_evaluations += evals

        self.updateTemparature()

    def SALS(solution, max_evals):
        """ Applies simulated annealing as a local search procedure."""

        sa = SA(solution.problem, solution = solution)
        sa.saveExecutionInformation(0,0,max_evals,Execution.fixed_evaluations)
        sa.initialComputations1()
        while max_evals > sa.num_evaluations:
            sa.iteration()
            #print("It:", i, "Temp:", sa.temp, "evals:", sa.num_evaluations, sa.best_sol)
            
        solution.perm = sa.best_sol.perm
        solution.ovalue = sa.best_sol.ovalue
        return sa.num_evaluations

@jit(float64(float64, float64), cache=True, nopython=True)
def newTemperature(temp, beta):
    return temp / (1 + beta*temp)
    
@jit(types.UniTuple(int64,3)(int64[:], int64[:], int64, int64, int64, float64, int64[:,:], int64[:,:]), cache=True, nopython=True)
def improveSolutionSA(perm, best_perm, best_ovalue_diff, neighbours_per_it, changes_per_it, temp, weights, distances):
    """Visits some random neighbours, accepting any of them which improves the solution and some of 
       the other ones under a temperature and objective value depending probability."""
    acceptances = 0
    num_evaluations = 0
    ovalue = 0
    for i in range(0, neighbours_per_it):
        # Computes a random neighbour.
        pos1 = random.randint(0, len(weights)-1)
        pos2 = (pos1 + random.randint(1, len(weights)-1)) % len(weights)
        cost_variation = applyTranspositionQAP(perm, pos1, pos2, weights, distances)
        num_evaluations+=1

        # Decides wether to keep the the neighbour or not.
        if cost_variation < 0 or random.random() <=  math.exp(-cost_variation / temp):
            acceptances += 1
            perm[pos1], perm[pos2] = exchange(perm[pos1], perm[pos2])
            ovalue += cost_variation

            if ovalue + best_ovalue_diff < 0:
                best_ovalue_diff = -ovalue
                best_perm[0:] = perm[0:]
            
            # If the maximum number of changes per iteration has been reached,
            # then finish the iteration.
            if acceptances == changes_per_it:
                break

    return best_ovalue_diff, ovalue, num_evaluations
