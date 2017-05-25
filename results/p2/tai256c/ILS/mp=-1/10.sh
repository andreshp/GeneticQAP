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
#$ -o ./results/p2/tai256c/ILS/mp=-1/10.sol

# File to wich the error stream is redirected.
#$ -e ./results/p2/tai256c/ILS/mp=-1/10.log

# Set working directory to the current one
#$ -cwd

python ./code/main_ma.py ./instances/tai256c.dat ils i 24 -lsme 50000 -mp -1 -seed 10 -csvf /tmp -csvs ILS_mp=-1_10; mv /tmp/objective_value_ILS_mp=-1_10.csv ./results/p2/tai256c/ILS/mp=-1/objective_value_10.csv

wait $!
