#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-kra30b

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/p2/kra30b/ILS-SA-0.001/3.sol

# File to wich the error stream is redirected.
#$ -e ./results/p2/kra30b/ILS-SA-0.001/3.log

# Set working directory to the current one
#$ -cwd

python ./code/main_ma.py ./instances/kra30b.dat ils i 24 -ls sa -lsme 50000 -ft 0.001 -seed 3 -csvf /tmp -csvs ILS-SA-0.001_3; mv /tmp/objective_value_ILS-SA-0.001_3.csv ./results/p2/kra30b/ILS-SA-0.001/objective_value_3.csv

wait $!
