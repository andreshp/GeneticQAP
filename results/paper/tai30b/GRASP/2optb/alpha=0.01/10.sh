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
#$ -o ./results/paper/tai30b/GRASP/2optb/alpha=0.01/10.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/tai30b/GRASP/2optb/alpha=0.01/10.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/tai30b.dat grasp t 9.0 -gr ind -ls 2optb -gra 0.01 -seed 10 -csvf /tmp -csvs GRASP_2optb_alpha=0.01_10; mv /tmp/objective_value_GRASP_2optb_alpha=0.01_10.csv ./results/paper/tai30b/GRASP/2optb/alpha=0.01/objective_value_10.csv

wait $!
