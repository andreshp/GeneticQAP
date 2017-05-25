#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-tho150

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/p2/tho150/ILS-SA/7.sol

# File to wich the error stream is redirected.
#$ -e ./results/p2/tho150/ILS-SA/7.log

# Set working directory to the current one
#$ -cwd

python ./code/main_ma.py ./instances/tho150.dat ils i 24 -ls sa -lsme 50000 -seed 7 -csvf /tmp -csvs ILS-SA_7; mv /tmp/objective_value_ILS-SA_7.csv ./results/p2/tho150/ILS-SA/objective_value_7.csv

wait $!
