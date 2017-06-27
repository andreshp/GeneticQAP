#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-esc32b

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/esc32b/GADEGD/original/ps=8/16.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/esc32b/GADEGD/original/ps=8/16.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/esc32b.dat gadegd t 10 -ps 8 -c PR -aux -seed 16 -csvf /tmp -csvs GADEGD_original_ps=8_16; mv /tmp/objective_value_GADEGD_original_ps=8_16.csv ./results/paper/esc32b/GADEGD/original/ps=8/objective_value_16.csv

wait $!
