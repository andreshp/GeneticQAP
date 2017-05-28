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
#$ -o ./results/p2/els19/ILS-SA-fixed/15.sol

# File to wich the error stream is redirected.
#$ -e ./results/p2/els19/ILS-SA-fixed/15.log

# Set working directory to the current one
#$ -cwd

python ./code/main_ma.py ./instances/els19.dat ils i 24 -ls sa -lsme 50000 -seed 15 -csvf /tmp -csvs ILS-SA-fixed_15; mv /tmp/objective_value_ILS-SA-fixed_15.csv ./results/p2/els19/ILS-SA-fixed/objective_value_15.csv

wait $!
