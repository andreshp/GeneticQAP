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
#$ -o ./results/p2/tai60a/ILS-SA-fixed/11.sol

# File to wich the error stream is redirected.
#$ -e ./results/p2/tai60a/ILS-SA-fixed/11.log

# Set working directory to the current one
#$ -cwd

python ./code/main_ma.py ./instances/tai60a.dat ils i 24 -ls sa -lsme 50000 -seed 11 -csvf /tmp -csvs ILS-SA-fixed_11; mv /tmp/objective_value_ILS-SA-fixed_11.csv ./results/p2/tai60a/ILS-SA-fixed/objective_value_11.csv

wait $!
