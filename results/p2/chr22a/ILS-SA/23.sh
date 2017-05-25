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
#$ -o ./results/p2/chr22a/ILS-SA/23.sol

# File to wich the error stream is redirected.
#$ -e ./results/p2/chr22a/ILS-SA/23.log

# Set working directory to the current one
#$ -cwd

python ./code/main_ma.py ./instances/chr22a.dat ils i 24 -ls sa -lsme 50000 -seed 23 -csvf /tmp -csvs ILS-SA_23; mv /tmp/objective_value_ILS-SA_23.csv ./results/p2/chr22a/ILS-SA/objective_value_23.csv

wait $!
