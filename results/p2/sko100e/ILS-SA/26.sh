#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-sko100e

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/p2/sko100e/ILS-SA/26.sol

# File to wich the error stream is redirected.
#$ -e ./results/p2/sko100e/ILS-SA/26.log

# Set working directory to the current one
#$ -cwd

python ./code/main_ma.py ./instances/sko100e.dat ils i 24 -ls sa -lsme 50000 -seed 26 -csvf /tmp -csvs ILS-SA_26; mv /tmp/objective_value_ILS-SA_26.csv ./results/p2/sko100e/ILS-SA/objective_value_26.csv

wait $!
