#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-sko100b

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/sko100b/GGA/PR/6.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/sko100b/GGA/PR/6.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/sko100b.dat gga t 100.0 -ps 60 -c PR -aux -seed 6 -csvf /tmp -csvs GGA_PR_6; mv /tmp/objective_value_GGA_PR_6.csv ./results/paper/sko100b/GGA/PR/objective_value_6.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GGA_PR_6.csv ./results/paper/sko100b/GGA/PR/diversity_6.csv; fi

wait $!
