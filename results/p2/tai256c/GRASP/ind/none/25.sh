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
#$ -o ./results/p2/tai256c/GRASP/ind/none/25.sol

# File to wich the error stream is redirected.
#$ -e ./results/p2/tai256c/GRASP/ind/none/25.log

# Set working directory to the current one
#$ -cwd

python ./code/main_ma.py ./instances/tai256c.dat grasp i 0 -gr ind -ls none -gra 0.3 -seed 25 -csvf /tmp -csvs GRASP_ind_none_25; mv /tmp/objective_value_GRASP_ind_none_25.csv ./results/p2/tai256c/GRASP/ind/none/objective_value_25.csv

wait $!
