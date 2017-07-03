#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-sko64

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/sko64/GGA/PR/26.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/sko64/GGA/PR/26.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/sko64.dat gga t 40.96 -ps 60 -c PR -aux -seed 26 -csvf /tmp -csvs GGA_PR_26; mv /tmp/objective_value_GGA_PR_26.csv ./results/paper/sko64/GGA/PR/objective_value_26.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GGA_PR_26.csv ./results/paper/sko64/GGA/PR/diversity_26.csv; fi

wait $!
