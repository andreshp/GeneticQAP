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
#$ -o ./results/p2/sko100d/ILS/mp=1/29.sol

# File to wich the error stream is redirected.
#$ -e ./results/p2/sko100d/ILS/mp=1/29.log

# Set working directory to the current one
#$ -cwd

python ./code/main_ma.py ./instances/sko100d.dat ils i 24 -lsme 50000 -mp 1 -seed 29 -csvf /tmp -csvs ILS_mp=1_29; mv /tmp/objective_value_ILS_mp=1_29.csv ./results/p2/sko100d/ILS/mp=1/objective_value_29.csv

wait $!
