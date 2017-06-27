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
#$ -o ./results/paper/esc32b/GADEGD/original/ps=16/26.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/esc32b/GADEGD/original/ps=16/26.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/esc32b.dat gadegd t 10 -ps 16 -c PR -aux -seed 26 -csvf /tmp -csvs GADEGD_original_ps=16_26; mv /tmp/objective_value_GADEGD_original_ps=16_26.csv ./results/paper/esc32b/GADEGD/original/ps=16/objective_value_26.csv

wait $!
