#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-sko100a

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/p2/sko100a/SA/t=-0.001/11.sol

# File to wich the error stream is redirected.
#$ -e ./results/p2/sko100a/SA/t=-0.001/11.log

# Set working directory to the current one
#$ -cwd

python ./code/main_ma.py ./instances/sko100a.dat sa e 50000 -ft -0.001 -seed 11 -csvf /tmp -csvs SA_t=-0.001_11; mv /tmp/objective_value_SA_t=-0.001_11.csv ./results/p2/sko100a/SA/t=-0.001/objective_value_11.csv

wait $!
