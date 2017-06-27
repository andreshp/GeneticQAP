#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-kra30b

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/kra30b/GADEGD/original/ps=64/2.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/kra30b/GADEGD/original/ps=64/2.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/kra30b.dat gadegd t 9 -ps 64 -c PR -aux -seed 2 -csvf /tmp -csvs GADEGD_original_ps=64_2; mv /tmp/objective_value_GADEGD_original_ps=64_2.csv ./results/paper/kra30b/GADEGD/original/ps=64/objective_value_2.csv

wait $!
