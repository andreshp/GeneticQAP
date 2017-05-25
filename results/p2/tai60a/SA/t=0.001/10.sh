#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-tai60a

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/p2/tai60a/SA/t=0.001/10.sol

# File to wich the error stream is redirected.
#$ -e ./results/p2/tai60a/SA/t=0.001/10.log

# Set working directory to the current one
#$ -cwd

python ./code/main_ma.py ./instances/tai60a.dat sa e 50000 -ft 0.001 -seed 10 -csvf /tmp -csvs SA_t=0.001_10; mv /tmp/objective_value_SA_t=0.001_10.csv ./results/p2/tai60a/SA/t=0.001/objective_value_10.csv

wait $!
