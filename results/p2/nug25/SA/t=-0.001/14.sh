#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-nug25

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/p2/nug25/SA/t=-0.001/14.sol

# File to wich the error stream is redirected.
#$ -e ./results/p2/nug25/SA/t=-0.001/14.log

# Set working directory to the current one
#$ -cwd

python ./code/main_ma.py ./instances/nug25.dat sa e 50000 -ft -0.001 -seed 14 -csvf /tmp -csvs SA_t=-0.001_14; mv /tmp/objective_value_SA_t=-0.001_14.csv ./results/p2/nug25/SA/t=-0.001/objective_value_14.csv

wait $!
