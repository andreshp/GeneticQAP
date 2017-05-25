#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-sko100c

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/p2/sko100c/SA/t=0.001/2.sol

# File to wich the error stream is redirected.
#$ -e ./results/p2/sko100c/SA/t=0.001/2.log

# Set working directory to the current one
#$ -cwd

python ./code/main_ma.py ./instances/sko100c.dat sa e 50000 -ft 0.001 -seed 2 -csvf /tmp -csvs SA_t=0.001_2; mv /tmp/objective_value_SA_t=0.001_2.csv ./results/p2/sko100c/SA/t=0.001/objective_value_2.csv

wait $!
