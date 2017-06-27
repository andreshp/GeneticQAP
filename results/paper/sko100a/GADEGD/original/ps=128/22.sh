#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-sko100a

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/sko100a/GADEGD/original/ps=128/22.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/sko100a/GADEGD/original/ps=128/22.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/sko100a.dat gadegd t 100 -ps 128 -c PR -aux -seed 22 -csvf /tmp -csvs GADEGD_original_ps=128_22; mv /tmp/objective_value_GADEGD_original_ps=128_22.csv ./results/paper/sko100a/GADEGD/original/ps=128/objective_value_22.csv

wait $!
