#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-tai30b

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/tai30b/GGA/PMX/27.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/tai30b/GGA/PMX/27.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/tai30b.dat gga t 9.0 -ps 60 -c PMX -aux -seed 27 -csvf /tmp -csvs GGA_PMX_27; mv /tmp/objective_value_GGA_PMX_27.csv ./results/paper/tai30b/GGA/PMX/objective_value_27.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GGA_PMX_27.csv ./results/paper/tai30b/GGA/PMX/diversity_27.csv; fi

wait $!
