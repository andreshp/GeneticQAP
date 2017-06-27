#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-tai30b

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/tai30b/GADEGD/original/ps=64/6.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/tai30b/GADEGD/original/ps=64/6.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/tai30b.dat gadegd t 9 -ps 64 -c PR -aux -seed 6 -csvf /tmp -csvs GADEGD_original_ps=64_6; mv /tmp/objective_value_GADEGD_original_ps=64_6.csv ./results/paper/tai30b/GADEGD/original/ps=64/objective_value_6.csv

wait $!
