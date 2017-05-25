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
#$ -o ./results/p2/tai50b/ILS/mp=-1/7.sol

# File to wich the error stream is redirected.
#$ -e ./results/p2/tai50b/ILS/mp=-1/7.log

# Set working directory to the current one
#$ -cwd

python ./code/main_ma.py ./instances/tai50b.dat ils i 24 -lsme 50000 -mp -1 -seed 7 -csvf /tmp -csvs ILS_mp=-1_7; mv /tmp/objective_value_ILS_mp=-1_7.csv ./results/p2/tai50b/ILS/mp=-1/objective_value_7.csv

wait $!
