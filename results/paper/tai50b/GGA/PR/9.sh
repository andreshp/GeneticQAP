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
#$ -o ./results/paper/tai50b/GGA/PR/9.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/tai50b/GGA/PR/9.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/tai50b.dat gga t 25.0 -ps 60 -c PR -aux -seed 9 -csvf /tmp -csvs GGA_PR_9; mv /tmp/objective_value_GGA_PR_9.csv ./results/paper/tai50b/GGA/PR/objective_value_9.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GGA_PR_9.csv ./results/paper/tai50b/GGA/PR/diversity_9.csv; fi

wait $!
