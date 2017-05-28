#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-chr20b

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/p2/chr20b/ILS-SA-0.001/20.sol

# File to wich the error stream is redirected.
#$ -e ./results/p2/chr20b/ILS-SA-0.001/20.log

# Set working directory to the current one
#$ -cwd

python ./code/main_ma.py ./instances/chr20b.dat ils i 24 -ls sa -lsme 50000 -ft 0.001 -seed 20 -csvf /tmp -csvs ILS-SA-0.001_20; mv /tmp/objective_value_ILS-SA-0.001_20.csv ./results/p2/chr20b/ILS-SA-0.001/objective_value_20.csv

wait $!
