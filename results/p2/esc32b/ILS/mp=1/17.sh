#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-esc32b

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/p2/esc32b/ILS/mp=1/17.sol

# File to wich the error stream is redirected.
#$ -e ./results/p2/esc32b/ILS/mp=1/17.log

# Set working directory to the current one
#$ -cwd

python ./code/main_ma.py ./instances/esc32b.dat ils i 24 -lsme 50000 -mp 1 -seed 17 -csvf /tmp -csvs ILS_mp=1_17; mv /tmp/objective_value_ILS_mp=1_17.csv ./results/p2/esc32b/ILS/mp=1/objective_value_17.csv

wait $!
