#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-tai30b

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/tai30b/GRASP/2optb/alpha=0.1/22.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/tai30b/GRASP/2optb/alpha=0.1/22.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/tai30b.dat grasp t 9.0 -gr ind -ls 2optb -gra 0.1 -seed 22 -csvf /tmp -csvs GRASP_2optb_alpha=0.1_22; mv /tmp/objective_value_GRASP_2optb_alpha=0.1_22.csv ./results/paper/tai30b/GRASP/2optb/alpha=0.1/objective_value_22.csv

wait $!
