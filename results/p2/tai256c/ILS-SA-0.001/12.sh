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
#$ -o ./results/p2/tai256c/ILS-SA-0.001/12.sol

# File to wich the error stream is redirected.
#$ -e ./results/p2/tai256c/ILS-SA-0.001/12.log

# Set working directory to the current one
#$ -cwd

python ./code/main_ma.py ./instances/tai256c.dat ils i 24 -ls sa -lsme 50000 -ft 0.001 -seed 12 -csvf /tmp -csvs ILS-SA-0.001_12; mv /tmp/objective_value_ILS-SA-0.001_12.csv ./results/p2/tai256c/ILS-SA-0.001/objective_value_12.csv

wait $!
