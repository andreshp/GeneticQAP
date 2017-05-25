#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-sko100b

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/p2/sko100b/ILS/mp=-1/19.sol

# File to wich the error stream is redirected.
#$ -e ./results/p2/sko100b/ILS/mp=-1/19.log

# Set working directory to the current one
#$ -cwd

python ./code/main_ma.py ./instances/sko100b.dat ils i 24 -lsme 50000 -mp -1 -seed 19 -csvf /tmp -csvs ILS_mp=-1_19; mv /tmp/objective_value_ILS_mp=-1_19.csv ./results/p2/sko100b/ILS/mp=-1/objective_value_19.csv

wait $!
