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
#$ -o ./results/paper/tai256c/GGA/PMX/7.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/tai256c/GGA/PMX/7.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/tai256c.dat gga t 655.36 -ps 60 -c PMX -aux -seed 7 -csvf /tmp -csvs GGA_PMX_7; mv /tmp/objective_value_GGA_PMX_7.csv ./results/paper/tai256c/GGA/PMX/objective_value_7.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GGA_PMX_7.csv ./results/paper/tai256c/GGA/PMX/diversity_7.csv; fi

wait $!
