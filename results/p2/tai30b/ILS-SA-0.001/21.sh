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
#$ -o ./results/p2/tai30b/ILS-SA-0.001/21.sol

# File to wich the error stream is redirected.
#$ -e ./results/p2/tai30b/ILS-SA-0.001/21.log

# Set working directory to the current one
#$ -cwd

python ./code/main_ma.py ./instances/tai30b.dat ils i 24 -ls sa -lsme 50000 -ft 0.001 -seed 21 -csvf /tmp -csvs ILS-SA-0.001_21; mv /tmp/objective_value_ILS-SA-0.001_21.csv ./results/p2/tai30b/ILS-SA-0.001/objective_value_21.csv

wait $!
