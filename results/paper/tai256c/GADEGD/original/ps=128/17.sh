#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-tai256c

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/tai256c/GADEGD/original/ps=128/17.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/tai256c/GADEGD/original/ps=128/17.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/tai256c.dat gadegd t 655 -ps 128 -c PR -aux -seed 17 -csvf /tmp -csvs GADEGD_original_ps=128_17; mv /tmp/objective_value_GADEGD_original_ps=128_17.csv ./results/paper/tai256c/GADEGD/original/ps=128/objective_value_17.csv

wait $!
