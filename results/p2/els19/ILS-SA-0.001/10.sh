#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-els19

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/p2/els19/ILS-SA-0.001/10.sol

# File to wich the error stream is redirected.
#$ -e ./results/p2/els19/ILS-SA-0.001/10.log

# Set working directory to the current one
#$ -cwd

python ./code/main_ma.py ./instances/els19.dat ils i 24 -ls sa -lsme 50000 -ft 0.001 -seed 10 -csvf /tmp -csvs ILS-SA-0.001_10; mv /tmp/objective_value_ILS-SA-0.001_10.csv ./results/p2/els19/ILS-SA-0.001/objective_value_10.csv

wait $!
