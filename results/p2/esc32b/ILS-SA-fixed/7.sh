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
#$ -o ./results/p2/esc32b/ILS-SA-fixed/7.sol

# File to wich the error stream is redirected.
#$ -e ./results/p2/esc32b/ILS-SA-fixed/7.log

# Set working directory to the current one
#$ -cwd

python ./code/main_ma.py ./instances/esc32b.dat ils i 24 -ls sa -lsme 50000 -seed 7 -csvf /tmp -csvs ILS-SA-fixed_7; mv /tmp/objective_value_ILS-SA-fixed_7.csv ./results/p2/esc32b/ILS-SA-fixed/objective_value_7.csv

wait $!
