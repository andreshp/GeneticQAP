#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-sko56

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/p2/sko56/SA/t=-0.001/28.sol

# File to wich the error stream is redirected.
#$ -e ./results/p2/sko56/SA/t=-0.001/28.log

# Set working directory to the current one
#$ -cwd

python ./code/main_ma.py ./instances/sko56.dat sa e 50000 -ft -0.001 -seed 28 -csvf /tmp -csvs SA_t=-0.001_28; mv /tmp/objective_value_SA_t=-0.001_28.csv ./results/p2/sko56/SA/t=-0.001/objective_value_28.csv

wait $!
