#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-tai60a

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/tai60a/GGA/PR/10.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/tai60a/GGA/PR/10.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/tai60a.dat gga t 36.0 -ps 60 -c PR -aux -seed 10 -csvf /tmp -csvs GGA_PR_10; mv /tmp/objective_value_GGA_PR_10.csv ./results/paper/tai60a/GGA/PR/objective_value_10.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GGA_PR_10.csv ./results/paper/tai60a/GGA/PR/diversity_10.csv; fi

wait $!
