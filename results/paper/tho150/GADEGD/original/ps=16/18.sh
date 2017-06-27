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
#$ -o ./results/paper/tho150/GADEGD/original/ps=16/18.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/tho150/GADEGD/original/ps=16/18.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/tho150.dat gadegd t 225 -ps 16 -c PR -aux -seed 18 -csvf /tmp -csvs GADEGD_original_ps=16_18; mv /tmp/objective_value_GADEGD_original_ps=16_18.csv ./results/paper/tho150/GADEGD/original/ps=16/objective_value_18.csv

wait $!
