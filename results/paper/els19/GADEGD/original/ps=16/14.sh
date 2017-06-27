#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-els19

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/els19/GADEGD/original/ps=16/14.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/els19/GADEGD/original/ps=16/14.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/els19.dat gadegd t 3 -ps 16 -c PR -aux -seed 14 -csvf /tmp -csvs GADEGD_original_ps=16_14; mv /tmp/objective_value_GADEGD_original_ps=16_14.csv ./results/paper/els19/GADEGD/original/ps=16/objective_value_14.csv

wait $!
