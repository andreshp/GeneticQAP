#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-chr20b

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/chr20b/GGA/PR/8.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/chr20b/GGA/PR/8.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/chr20b.dat gga t 4.0 -ps 60 -c PR -aux -seed 8 -csvf /tmp -csvs GGA_PR_8; mv /tmp/objective_value_GGA_PR_8.csv ./results/paper/chr20b/GGA/PR/objective_value_8.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GGA_PR_8.csv ./results/paper/chr20b/GGA/PR/diversity_8.csv; fi

wait $!
