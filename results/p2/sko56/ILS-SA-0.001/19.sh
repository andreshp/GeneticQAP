#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-sko56

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/p2/sko56/ILS-SA-0.001/19.sol

# File to wich the error stream is redirected.
#$ -e ./results/p2/sko56/ILS-SA-0.001/19.log

# Set working directory to the current one
#$ -cwd

python ./code/main_ma.py ./instances/sko56.dat ils i 24 -ls sa -lsme 50000 -ft 0.001 -seed 19 -csvf /tmp -csvs ILS-SA-0.001_19; mv /tmp/objective_value_ILS-SA-0.001_19.csv ./results/p2/sko56/ILS-SA-0.001/objective_value_19.csv

wait $!
