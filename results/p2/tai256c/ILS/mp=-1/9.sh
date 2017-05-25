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
#$ -o ./results/p2/tai256c/ILS/mp=-1/9.sol

# File to wich the error stream is redirected.
#$ -e ./results/p2/tai256c/ILS/mp=-1/9.log

# Set working directory to the current one
#$ -cwd

python ./code/main_ma.py ./instances/tai256c.dat ils i 24 -lsme 50000 -mp -1 -seed 9 -csvf /tmp -csvs ILS_mp=-1_9; mv /tmp/objective_value_ILS_mp=-1_9.csv ./results/p2/tai256c/ILS/mp=-1/objective_value_9.csv

wait $!
