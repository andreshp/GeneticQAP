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
#$ -o ./results/paper/sko100b/GGA/PR/21.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/sko100b/GGA/PR/21.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/sko100b.dat gga t 100.0 -ps 60 -c PR -aux -seed 21 -csvf /tmp -csvs GGA_PR_21; mv /tmp/objective_value_GGA_PR_21.csv ./results/paper/sko100b/GGA/PR/objective_value_21.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GGA_PR_21.csv ./results/paper/sko100b/GGA/PR/diversity_21.csv; fi

wait $!
