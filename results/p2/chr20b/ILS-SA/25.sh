#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-chr20b

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/p2/chr20b/ILS-SA/25.sol

# File to wich the error stream is redirected.
#$ -e ./results/p2/chr20b/ILS-SA/25.log

# Set working directory to the current one
#$ -cwd

python ./code/main_ma.py ./instances/chr20b.dat ils i 24 -ls sa -tf -0.001 -lsme 50000 -seed 25 -csvf /tmp -csvs ILS-SA_25; mv /tmp/objective_value_ILS-SA_25.csv ./results/p2/chr20b/ILS-SA/objective_value_25.csv

wait $!
