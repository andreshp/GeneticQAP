#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-sko100c

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/p2/sko100c/ILS-SA-fixed/21.sol

# File to wich the error stream is redirected.
#$ -e ./results/p2/sko100c/ILS-SA-fixed/21.log

# Set working directory to the current one
#$ -cwd

python ./code/main_ma.py ./instances/sko100c.dat ils i 24 -ls sa -lsme 50000 -seed 21 -csvf /tmp -csvs ILS-SA-fixed_21; mv /tmp/objective_value_ILS-SA-fixed_21.csv ./results/p2/sko100c/ILS-SA-fixed/objective_value_21.csv

wait $!
