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
#$ -o ./results/paper/tai256c/GADEGD/original/ps=64/9.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/tai256c/GADEGD/original/ps=64/9.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/tai256c.dat gadegd t 655 -ps 64 -c PR -aux -seed 9 -csvf /tmp -csvs GADEGD_original_ps=64_9; mv /tmp/objective_value_GADEGD_original_ps=64_9.csv ./results/paper/tai256c/GADEGD/original/ps=64/objective_value_9.csv

wait $!
