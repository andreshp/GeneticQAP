#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-sko100e

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/sko100e/GADEGD/original/ps=16/12.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/sko100e/GADEGD/original/ps=16/12.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/sko100e.dat gadegd t 100 -ps 16 -c PR -aux -seed 12 -csvf /tmp -csvs GADEGD_original_ps=16_12; mv /tmp/objective_value_GADEGD_original_ps=16_12.csv ./results/paper/sko100e/GADEGD/original/ps=16/objective_value_12.csv

wait $!
