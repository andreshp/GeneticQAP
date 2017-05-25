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
#$ -o ./results/p2/tai30b/ILS-SA/14.sol

# File to wich the error stream is redirected.
#$ -e ./results/p2/tai30b/ILS-SA/14.log

# Set working directory to the current one
#$ -cwd

python ./code/main_ma.py ./instances/tai30b.dat ils i 24 -ls sa -lsme 50000 -seed 14 -csvf /tmp -csvs ILS-SA_14; mv /tmp/objective_value_ILS-SA_14.csv ./results/p2/tai30b/ILS-SA/objective_value_14.csv

wait $!
