#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-lipa90b

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/lipa90b/GADEGD/original/ps=16/5.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/lipa90b/GADEGD/original/ps=16/5.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/lipa90b.dat gadegd t 81 -ps 16 -c PR -aux -seed 5 -csvf /tmp -csvs GADEGD_original_ps=16_5; mv /tmp/objective_value_GADEGD_original_ps=16_5.csv ./results/paper/lipa90b/GADEGD/original/ps=16/objective_value_5.csv

wait $!
