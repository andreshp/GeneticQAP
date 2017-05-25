#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-lipa90b

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/p2/lipa90b/SA/t=0.001/12.sol

# File to wich the error stream is redirected.
#$ -e ./results/p2/lipa90b/SA/t=0.001/12.log

# Set working directory to the current one
#$ -cwd

python ./code/main_ma.py ./instances/lipa90b.dat sa e 50000 -ft 0.001 -seed 12 -csvf /tmp -csvs SA_t=0.001_12; mv /tmp/objective_value_SA_t=0.001_12.csv ./results/p2/lipa90b/SA/t=0.001/objective_value_12.csv

wait $!
