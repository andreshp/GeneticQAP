#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-tai60a

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/tai60a/GADEGD/original/ps=8/18.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/tai60a/GADEGD/original/ps=8/18.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/tai60a.dat gadegd t 36 -ps 8 -c PR -aux -seed 18 -csvf /tmp -csvs GADEGD_original_ps=8_18; mv /tmp/objective_value_GADEGD_original_ps=8_18.csv ./results/paper/tai60a/GADEGD/original/ps=8/objective_value_18.csv

wait $!
