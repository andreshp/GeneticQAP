#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-tai50b

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/tai50b/GADEGD/original/ps=8/14.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/tai50b/GADEGD/original/ps=8/14.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/tai50b.dat gadegd t 25 -ps 8 -c PR -aux -seed 14 -csvf /tmp -csvs GADEGD_original_ps=8_14; mv /tmp/objective_value_GADEGD_original_ps=8_14.csv ./results/paper/tai50b/GADEGD/original/ps=8/objective_value_14.csv

wait $!
