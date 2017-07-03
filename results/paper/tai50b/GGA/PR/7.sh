#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-tai50b

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/tai50b/GGA/PR/7.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/tai50b/GGA/PR/7.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/tai50b.dat gga t 25.0 -ps 60 -c PR -aux -seed 7 -csvf /tmp -csvs GGA_PR_7; mv /tmp/objective_value_GGA_PR_7.csv ./results/paper/tai50b/GGA/PR/objective_value_7.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GGA_PR_7.csv ./results/paper/tai50b/GGA/PR/diversity_7.csv; fi

wait $!
