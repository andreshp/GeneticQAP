#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-chr22a

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/p2/chr22a/ILS-SA-0.001/24.sol

# File to wich the error stream is redirected.
#$ -e ./results/p2/chr22a/ILS-SA-0.001/24.log

# Set working directory to the current one
#$ -cwd

python ./code/main_ma.py ./instances/chr22a.dat ils i 24 -ls sa -lsme 50000 -ft 0.001 -seed 24 -csvf /tmp -csvs ILS-SA-0.001_24; mv /tmp/objective_value_ILS-SA-0.001_24.csv ./results/p2/chr22a/ILS-SA-0.001/objective_value_24.csv

wait $!
