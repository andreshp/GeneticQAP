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
#$ -o ./results/p2/esc32b/SA/t=0.001/23.sol

# File to wich the error stream is redirected.
#$ -e ./results/p2/esc32b/SA/t=0.001/23.log

# Set working directory to the current one
#$ -cwd

python ./code/main_ma.py ./instances/esc32b.dat sa e 50000 -ft 0.001 -seed 23 -csvf /tmp -csvs SA_t=0.001_23; mv /tmp/objective_value_SA_t=0.001_23.csv ./results/p2/esc32b/SA/t=0.001/objective_value_23.csv

wait $!
