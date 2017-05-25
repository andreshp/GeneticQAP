#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-chr22a

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/p2/chr22a/ILS-SA/29.sol

# File to wich the error stream is redirected.
#$ -e ./results/p2/chr22a/ILS-SA/29.log

# Set working directory to the current one
#$ -cwd

python ./code/main_ma.py ./instances/chr22a.dat ils i 24 -ls sa -lsme 50000 -seed 29 -csvf /tmp -csvs ILS-SA_29; mv /tmp/objective_value_ILS-SA_29.csv ./results/p2/chr22a/ILS-SA/objective_value_29.csv

wait $!
