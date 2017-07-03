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
#$ -o ./results/paper/tai50b/GGA/PMX/6.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/tai50b/GGA/PMX/6.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/tai50b.dat gga t 25.0 -ps 60 -c PMX -aux -seed 6 -csvf /tmp -csvs GGA_PMX_6; mv /tmp/objective_value_GGA_PMX_6.csv ./results/paper/tai50b/GGA/PMX/objective_value_6.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GGA_PMX_6.csv ./results/paper/tai50b/GGA/PMX/diversity_6.csv; fi

wait $!
