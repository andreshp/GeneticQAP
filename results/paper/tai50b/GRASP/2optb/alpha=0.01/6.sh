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
#$ -o ./results/paper/tai50b/GRASP/2optb/alpha=0.01/6.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/tai50b/GRASP/2optb/alpha=0.01/6.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/tai50b.dat grasp t 25.0 -gr ind -ls 2optb -gra 0.01 -seed 6 -csvf /tmp -csvs GRASP_2optb_alpha=0.01_6; mv /tmp/objective_value_GRASP_2optb_alpha=0.01_6.csv ./results/paper/tai50b/GRASP/2optb/alpha=0.01/objective_value_6.csv

wait $!
