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
#$ -o ./results/paper/tai256c/GRASP/2optb/alpha=0.05/7.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/tai256c/GRASP/2optb/alpha=0.05/7.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/tai256c.dat grasp t 655.36 -gr ind -ls 2optb -gra 0.05 -seed 7 -csvf /tmp -csvs GRASP_2optb_alpha=0.05_7; mv /tmp/objective_value_GRASP_2optb_alpha=0.05_7.csv ./results/paper/tai256c/GRASP/2optb/alpha=0.05/objective_value_7.csv

wait $!
