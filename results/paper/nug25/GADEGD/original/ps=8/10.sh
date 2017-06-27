#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-nug25

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/nug25/GADEGD/original/ps=8/10.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/nug25/GADEGD/original/ps=8/10.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/nug25.dat gadegd t 6 -ps 8 -c PR -aux -seed 10 -csvf /tmp -csvs GADEGD_original_ps=8_10; mv /tmp/objective_value_GADEGD_original_ps=8_10.csv ./results/paper/nug25/GADEGD/original/ps=8/objective_value_10.csv

wait $!
