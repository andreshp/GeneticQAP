#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-tai50b

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/tai50b/GGA/PMX/8.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/tai50b/GGA/PMX/8.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/tai50b.dat gga t 25.0 -ps 60 -c PMX -aux -seed 8 -csvf /tmp -csvs GGA_PMX_8; mv /tmp/objective_value_GGA_PMX_8.csv ./results/paper/tai50b/GGA/PMX/objective_value_8.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GGA_PMX_8.csv ./results/paper/tai50b/GGA/PMX/diversity_8.csv; fi

wait $!
