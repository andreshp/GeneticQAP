#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-sko100e

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/p2/sko100e/ILS/mp=-1/6.sol

# File to wich the error stream is redirected.
#$ -e ./results/p2/sko100e/ILS/mp=-1/6.log

# Set working directory to the current one
#$ -cwd

python ./code/main_ma.py ./instances/sko100e.dat ils i 24 -lsme 50000 -mp -1 -seed 6 -csvf /tmp -csvs ILS_mp=-1_6; mv /tmp/objective_value_ILS_mp=-1_6.csv ./results/p2/sko100e/ILS/mp=-1/objective_value_6.csv

wait $!
