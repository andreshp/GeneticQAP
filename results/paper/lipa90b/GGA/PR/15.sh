#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-lipa90b

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/lipa90b/GGA/PR/15.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/lipa90b/GGA/PR/15.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/lipa90b.dat gga t 81.0 -ps 60 -c PR -aux -seed 15 -csvf /tmp -csvs GGA_PR_15; mv /tmp/objective_value_GGA_PR_15.csv ./results/paper/lipa90b/GGA/PR/objective_value_15.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GGA_PR_15.csv ./results/paper/lipa90b/GGA/PR/diversity_15.csv; fi

wait $!
