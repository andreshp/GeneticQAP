#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-sko72

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/p2/sko72/ILS/mp=1/20.sol

# File to wich the error stream is redirected.
#$ -e ./results/p2/sko72/ILS/mp=1/20.log

# Set working directory to the current one
#$ -cwd

python ./code/main_ma.py ./instances/sko72.dat ils i 24 -lsme 50000 -mp 1 -seed 20 -csvf /tmp -csvs ILS_mp=1_20; mv /tmp/objective_value_ILS_mp=1_20.csv ./results/p2/sko72/ILS/mp=1/objective_value_20.csv

wait $!
