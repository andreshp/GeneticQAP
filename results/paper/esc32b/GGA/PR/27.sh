#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-esc32b

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/esc32b/GGA/PR/27.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/esc32b/GGA/PR/27.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/esc32b.dat gga t 10.24 -ps 60 -c PR -aux -seed 27 -csvf /tmp -csvs GGA_PR_27; mv /tmp/objective_value_GGA_PR_27.csv ./results/paper/esc32b/GGA/PR/objective_value_27.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GGA_PR_27.csv ./results/paper/esc32b/GGA/PR/diversity_27.csv; fi

wait $!
