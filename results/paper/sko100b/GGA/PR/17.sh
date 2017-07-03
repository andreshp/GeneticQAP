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
#$ -o ./results/paper/sko100b/GGA/PR/17.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/sko100b/GGA/PR/17.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/sko100b.dat gga t 100.0 -ps 60 -c PR -aux -seed 17 -csvf /tmp -csvs GGA_PR_17; mv /tmp/objective_value_GGA_PR_17.csv ./results/paper/sko100b/GGA/PR/objective_value_17.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GGA_PR_17.csv ./results/paper/sko100b/GGA/PR/diversity_17.csv; fi

wait $!
