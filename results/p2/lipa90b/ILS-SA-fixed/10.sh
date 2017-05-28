#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-lipa90b

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/p2/lipa90b/ILS-SA-fixed/10.sol

# File to wich the error stream is redirected.
#$ -e ./results/p2/lipa90b/ILS-SA-fixed/10.log

# Set working directory to the current one
#$ -cwd

python ./code/main_ma.py ./instances/lipa90b.dat ils i 24 -ls sa -lsme 50000 -seed 10 -csvf /tmp -csvs ILS-SA-fixed_10; mv /tmp/objective_value_ILS-SA-fixed_10.csv ./results/p2/lipa90b/ILS-SA-fixed/objective_value_10.csv

wait $!
