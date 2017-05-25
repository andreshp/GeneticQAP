#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-tai50b

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/p2/tai50b/SA/t=0.001/24.sol

# File to wich the error stream is redirected.
#$ -e ./results/p2/tai50b/SA/t=0.001/24.log

# Set working directory to the current one
#$ -cwd

python ./code/main_ma.py ./instances/tai50b.dat sa e 50000 -ft 0.001 -seed 24 -csvf /tmp -csvs SA_t=0.001_24; mv /tmp/objective_value_SA_t=0.001_24.csv ./results/p2/tai50b/SA/t=0.001/objective_value_24.csv

wait $!
