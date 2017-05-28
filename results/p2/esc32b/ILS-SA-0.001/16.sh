#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-esc32b

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/p2/esc32b/ILS-SA-0.001/16.sol

# File to wich the error stream is redirected.
#$ -e ./results/p2/esc32b/ILS-SA-0.001/16.log

# Set working directory to the current one
#$ -cwd

python ./code/main_ma.py ./instances/esc32b.dat ils i 24 -ls sa -lsme 50000 -ft 0.001 -seed 16 -csvf /tmp -csvs ILS-SA-0.001_16; mv /tmp/objective_value_ILS-SA-0.001_16.csv ./results/p2/esc32b/ILS-SA-0.001/objective_value_16.csv

wait $!
