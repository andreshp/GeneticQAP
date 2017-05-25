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
#$ -o ./results/p2/sko100b/SA/t=0.001/18.sol

# File to wich the error stream is redirected.
#$ -e ./results/p2/sko100b/SA/t=0.001/18.log

# Set working directory to the current one
#$ -cwd

python ./code/main_ma.py ./instances/sko100b.dat sa e 50000 -ft 0.001 -seed 18 -csvf /tmp -csvs SA_t=0.001_18; mv /tmp/objective_value_SA_t=0.001_18.csv ./results/p2/sko100b/SA/t=0.001/objective_value_18.csv

wait $!
