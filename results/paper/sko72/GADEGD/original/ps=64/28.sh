#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-sko72

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/sko72/GADEGD/original/ps=64/28.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/sko72/GADEGD/original/ps=64/28.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/sko72.dat gadegd t 51 -ps 64 -c PR -aux -seed 28 -csvf /tmp -csvs GADEGD_original_ps=64_28; mv /tmp/objective_value_GADEGD_original_ps=64_28.csv ./results/paper/sko72/GADEGD/original/ps=64/objective_value_28.csv

wait $!
