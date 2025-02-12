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
#$ -o ./results/p2/tai60a/ILS-SA-fixed/17.sol

# File to wich the error stream is redirected.
#$ -e ./results/p2/tai60a/ILS-SA-fixed/17.log

# Set working directory to the current one
#$ -cwd

python ./code/main_ma.py ./instances/tai60a.dat ils i 24 -ls sa -lsme 50000 -seed 17 -csvf /tmp -csvs ILS-SA-fixed_17; mv /tmp/objective_value_ILS-SA-fixed_17.csv ./results/p2/tai60a/ILS-SA-fixed/objective_value_17.csv

wait $!
