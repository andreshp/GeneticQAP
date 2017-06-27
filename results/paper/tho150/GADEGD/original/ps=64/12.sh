#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-tho150

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/tho150/GADEGD/original/ps=64/12.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/tho150/GADEGD/original/ps=64/12.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/tho150.dat gadegd t 225 -ps 64 -c PR -aux -seed 12 -csvf /tmp -csvs GADEGD_original_ps=64_12; mv /tmp/objective_value_GADEGD_original_ps=64_12.csv ./results/paper/tho150/GADEGD/original/ps=64/objective_value_12.csv

wait $!
