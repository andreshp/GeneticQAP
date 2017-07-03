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
#$ -o ./results/paper/sko64/GGA/PR/4.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/sko64/GGA/PR/4.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/sko64.dat gga t 40.96 -ps 60 -c PR -aux -seed 4 -csvf /tmp -csvs GGA_PR_4; mv /tmp/objective_value_GGA_PR_4.csv ./results/paper/sko64/GGA/PR/objective_value_4.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GGA_PR_4.csv ./results/paper/sko64/GGA/PR/diversity_4.csv; fi

wait $!
