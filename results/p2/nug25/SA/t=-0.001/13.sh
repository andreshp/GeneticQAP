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
#$ -o ./results/p2/nug25/SA/t=-0.001/13.sol

# File to wich the error stream is redirected.
#$ -e ./results/p2/nug25/SA/t=-0.001/13.log

# Set working directory to the current one
#$ -cwd

python ./code/main_ma.py ./instances/nug25.dat sa e 50000 -ft -0.001 -seed 13 -csvf /tmp -csvs SA_t=-0.001_13; mv /tmp/objective_value_SA_t=-0.001_13.csv ./results/p2/nug25/SA/t=-0.001/objective_value_13.csv

wait $!
