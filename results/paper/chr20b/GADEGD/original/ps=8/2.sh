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
#$ -o ./results/paper/chr20b/GADEGD/original/ps=8/2.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/chr20b/GADEGD/original/ps=8/2.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/chr20b.dat gadegd t 4 -ps 8 -c PR -aux -seed 2 -csvf /tmp -csvs GADEGD_original_ps=8_2; mv /tmp/objective_value_GADEGD_original_ps=8_2.csv ./results/paper/chr20b/GADEGD/original/ps=8/objective_value_2.csv

wait $!
