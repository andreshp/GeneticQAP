#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-sko100e

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/p2/sko100e/SA/t=-0.001/1.sol

# File to wich the error stream is redirected.
#$ -e ./results/p2/sko100e/SA/t=-0.001/1.log

# Set working directory to the current one
#$ -cwd

python ./code/main_ma.py ./instances/sko100e.dat sa e 50000 -ft -0.001 -seed 1 -csvf /tmp -csvs SA_t=-0.001_1; mv /tmp/objective_value_SA_t=-0.001_1.csv ./results/p2/sko100e/SA/t=-0.001/objective_value_1.csv

wait $!
