#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-sko64

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/p2/sko64/ILS-SA/1.sol

# File to wich the error stream is redirected.
#$ -e ./results/p2/sko64/ILS-SA/1.log

# Set working directory to the current one
#$ -cwd

python ./code/main_ma.py ./instances/sko64.dat ils i 24 -ls sa -lsme 50000 -seed 1 -csvf /tmp -csvs ILS-SA_1; mv /tmp/objective_value_ILS-SA_1.csv ./results/p2/sko64/ILS-SA/objective_value_1.csv

wait $!
