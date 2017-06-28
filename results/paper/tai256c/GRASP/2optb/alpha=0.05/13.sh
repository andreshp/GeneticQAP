#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-tai256c

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/tai256c/GRASP/2optb/alpha=0.05/13.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/tai256c/GRASP/2optb/alpha=0.05/13.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/tai256c.dat grasp t 655.36 -gr ind -ls 2optb -gra 0.05 -seed 13 -csvf /tmp -csvs GRASP_2optb_alpha=0.05_13; mv /tmp/objective_value_GRASP_2optb_alpha=0.05_13.csv ./results/paper/tai256c/GRASP/2optb/alpha=0.05/objective_value_13.csv

wait $!
