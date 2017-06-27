#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-chr20b

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/chr20b/GADEGD/original/ps=16/7.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/chr20b/GADEGD/original/ps=16/7.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/chr20b.dat gadegd t 4 -ps 16 -c PR -aux -seed 7 -csvf /tmp -csvs GADEGD_original_ps=16_7; mv /tmp/objective_value_GADEGD_original_ps=16_7.csv ./results/paper/chr20b/GADEGD/original/ps=16/objective_value_7.csv

wait $!
