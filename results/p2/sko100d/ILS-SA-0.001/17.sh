#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-sko100d

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/p2/sko100d/ILS-SA-0.001/17.sol

# File to wich the error stream is redirected.
#$ -e ./results/p2/sko100d/ILS-SA-0.001/17.log

# Set working directory to the current one
#$ -cwd

python ./code/main_ma.py ./instances/sko100d.dat ils i 24 -ls sa -lsme 50000 -ft 0.001 -seed 17 -csvf /tmp -csvs ILS-SA-0.001_17; mv /tmp/objective_value_ILS-SA-0.001_17.csv ./results/p2/sko100d/ILS-SA-0.001/objective_value_17.csv

wait $!
