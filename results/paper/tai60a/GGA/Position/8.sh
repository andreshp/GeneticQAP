#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-tai60a

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/tai60a/GGA/Position/8.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/tai60a/GGA/Position/8.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/tai60a.dat gga t 36.0 -ps 60 -c Position -aux -seed 8 -csvf /tmp -csvs GGA_Position_8; mv /tmp/objective_value_GGA_Position_8.csv ./results/paper/tai60a/GGA/Position/objective_value_8.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GGA_Position_8.csv ./results/paper/tai60a/GGA/Position/diversity_8.csv; fi

wait $!
