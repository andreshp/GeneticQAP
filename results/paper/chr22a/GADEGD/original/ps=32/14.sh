#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-chr22a

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/chr22a/GADEGD/original/ps=32/14.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/chr22a/GADEGD/original/ps=32/14.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/chr22a.dat gadegd t 4 -ps 32 -c PR -aux -seed 14 -csvf /tmp -csvs GADEGD_original_ps=32_14; mv /tmp/objective_value_GADEGD_original_ps=32_14.csv ./results/paper/chr22a/GADEGD/original/ps=32/objective_value_14.csv

wait $!
