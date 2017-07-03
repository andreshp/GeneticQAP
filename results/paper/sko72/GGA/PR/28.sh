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
#$ -o ./results/paper/sko72/GGA/PR/28.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/sko72/GGA/PR/28.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/sko72.dat gga t 51.84 -ps 60 -c PR -aux -seed 28 -csvf /tmp -csvs GGA_PR_28; mv /tmp/objective_value_GGA_PR_28.csv ./results/paper/sko72/GGA/PR/objective_value_28.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GGA_PR_28.csv ./results/paper/sko72/GGA/PR/diversity_28.csv; fi

wait $!
