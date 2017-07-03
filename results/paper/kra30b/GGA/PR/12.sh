#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-kra30b

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/kra30b/GGA/PR/12.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/kra30b/GGA/PR/12.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/kra30b.dat gga t 9.0 -ps 60 -c PR -aux -seed 12 -csvf /tmp -csvs GGA_PR_12; mv /tmp/objective_value_GGA_PR_12.csv ./results/paper/kra30b/GGA/PR/objective_value_12.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GGA_PR_12.csv ./results/paper/kra30b/GGA/PR/diversity_12.csv; fi

wait $!
