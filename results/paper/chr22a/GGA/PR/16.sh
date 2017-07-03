#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-chr22a

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/chr22a/GGA/PR/16.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/chr22a/GGA/PR/16.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/chr22a.dat gga t 4.84 -ps 60 -c PR -aux -seed 16 -csvf /tmp -csvs GGA_PR_16; mv /tmp/objective_value_GGA_PR_16.csv ./results/paper/chr22a/GGA/PR/objective_value_16.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GGA_PR_16.csv ./results/paper/chr22a/GGA/PR/diversity_16.csv; fi

wait $!
