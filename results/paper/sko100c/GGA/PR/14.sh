#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-sko100c

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/sko100c/GGA/PR/14.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/sko100c/GGA/PR/14.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/sko100c.dat gga t 100.0 -ps 60 -c PR -aux -seed 14 -csvf /tmp -csvs GGA_PR_14; mv /tmp/objective_value_GGA_PR_14.csv ./results/paper/sko100c/GGA/PR/objective_value_14.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GGA_PR_14.csv ./results/paper/sko100c/GGA/PR/diversity_14.csv; fi

wait $!
