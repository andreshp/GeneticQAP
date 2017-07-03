#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-sko56

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/sko56/GGA/PR/29.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/sko56/GGA/PR/29.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/sko56.dat gga t 31.36 -ps 60 -c PR -aux -seed 29 -csvf /tmp -csvs GGA_PR_29; mv /tmp/objective_value_GGA_PR_29.csv ./results/paper/sko56/GGA/PR/objective_value_29.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GGA_PR_29.csv ./results/paper/sko56/GGA/PR/diversity_29.csv; fi

wait $!
