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
#$ -o ./results/p2/tai50b/ILS-SA-0.001/25.sol

# File to wich the error stream is redirected.
#$ -e ./results/p2/tai50b/ILS-SA-0.001/25.log

# Set working directory to the current one
#$ -cwd

python ./code/main_ma.py ./instances/tai50b.dat ils i 24 -ls sa -lsme 50000 -ft 0.001 -seed 25 -csvf /tmp -csvs ILS-SA-0.001_25; mv /tmp/objective_value_ILS-SA-0.001_25.csv ./results/p2/tai50b/ILS-SA-0.001/objective_value_25.csv

wait $!
