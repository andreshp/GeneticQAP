#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-tai50b

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/p2/tai50b/GRASP/ind/2optb/18.sol

# File to wich the error stream is redirected.
#$ -e ./results/p2/tai50b/GRASP/ind/2optb/18.log

# Set working directory to the current one
#$ -cwd

python ./code/main_ma.py ./instances/tai50b.dat grasp i 24 -gr ind -ls 2optb -gra 0.3 -lsme 50000 -seed 18 -csvf /tmp -csvs GRASP_ind_2optb_18; mv /tmp/objective_value_GRASP_ind_2optb_18.csv ./results/p2/tai50b/GRASP/ind/2optb/objective_value_18.csv

wait $!
