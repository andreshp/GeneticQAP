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
#$ -o ./results/paper/chr22a/GADEGD/original/ps=64/29.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/chr22a/GADEGD/original/ps=64/29.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/chr22a.dat gadegd t 4 -ps 64 -c PR -aux -seed 29 -csvf /tmp -csvs GADEGD_original_ps=64_29; mv /tmp/objective_value_GADEGD_original_ps=64_29.csv ./results/paper/chr22a/GADEGD/original/ps=64/objective_value_29.csv

wait $!
