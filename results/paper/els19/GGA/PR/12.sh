#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-els19

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/els19/GGA/PR/12.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/els19/GGA/PR/12.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/els19.dat gga t 3.61 -ps 60 -c PR -aux -seed 12 -csvf /tmp -csvs GGA_PR_12; mv /tmp/objective_value_GGA_PR_12.csv ./results/paper/els19/GGA/PR/objective_value_12.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GGA_PR_12.csv ./results/paper/els19/GGA/PR/diversity_12.csv; fi

wait $!
