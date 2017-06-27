#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-sko56

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/sko56/GADEGD/original/ps=64/15.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/sko56/GADEGD/original/ps=64/15.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/sko56.dat gadegd t 31 -ps 64 -c PR -aux -seed 15 -csvf /tmp -csvs GADEGD_original_ps=64_15; mv /tmp/objective_value_GADEGD_original_ps=64_15.csv ./results/paper/sko56/GADEGD/original/ps=64/objective_value_15.csv

wait $!
