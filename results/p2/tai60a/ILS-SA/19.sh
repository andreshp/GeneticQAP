#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-tai60a

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/p2/tai60a/ILS-SA/19.sol

# File to wich the error stream is redirected.
#$ -e ./results/p2/tai60a/ILS-SA/19.log

# Set working directory to the current one
#$ -cwd

python ./code/main_ma.py ./instances/tai60a.dat ils i 24 -ls sa -lsme 50000 -seed 19 -csvf /tmp -csvs ILS-SA_19; mv /tmp/objective_value_ILS-SA_19.csv ./results/p2/tai60a/ILS-SA/objective_value_19.csv

wait $!
