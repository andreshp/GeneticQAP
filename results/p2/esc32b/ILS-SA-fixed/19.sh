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
#$ -o ./results/p2/esc32b/ILS-SA-fixed/19.sol

# File to wich the error stream is redirected.
#$ -e ./results/p2/esc32b/ILS-SA-fixed/19.log

# Set working directory to the current one
#$ -cwd

python ./code/main_ma.py ./instances/esc32b.dat ils i 24 -ls sa -lsme 50000 -seed 19 -csvf /tmp -csvs ILS-SA-fixed_19; mv /tmp/objective_value_ILS-SA-fixed_19.csv ./results/p2/esc32b/ILS-SA-fixed/objective_value_19.csv

wait $!
