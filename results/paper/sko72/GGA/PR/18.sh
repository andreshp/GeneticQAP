#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-sko72

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/sko72/GGA/PR/18.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/sko72/GGA/PR/18.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/sko72.dat gga t 51.84 -ps 60 -c PR -aux -seed 18 -csvf /tmp -csvs GGA_PR_18; mv /tmp/objective_value_GGA_PR_18.csv ./results/paper/sko72/GGA/PR/objective_value_18.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GGA_PR_18.csv ./results/paper/sko72/GGA/PR/diversity_18.csv; fi

wait $!
