#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-nug25

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/p2/nug25/ILS-SA/22.sol

# File to wich the error stream is redirected.
#$ -e ./results/p2/nug25/ILS-SA/22.log

# Set working directory to the current one
#$ -cwd

python ./code/main_ma.py ./instances/nug25.dat ils i 24 -ls sa -lsme 50000 -seed 22 -csvf /tmp -csvs ILS-SA_22; mv /tmp/objective_value_ILS-SA_22.csv ./results/p2/nug25/ILS-SA/objective_value_22.csv

wait $!
