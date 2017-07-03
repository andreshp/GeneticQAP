#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-tai256c

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/tai256c/GGA/Position/22.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/tai256c/GGA/Position/22.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/tai256c.dat gga t 655.36 -ps 60 -c Position -aux -seed 22 -csvf /tmp -csvs GGA_Position_22; mv /tmp/objective_value_GGA_Position_22.csv ./results/paper/tai256c/GGA/Position/objective_value_22.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GGA_Position_22.csv ./results/paper/tai256c/GGA/Position/diversity_22.csv; fi

wait $!
