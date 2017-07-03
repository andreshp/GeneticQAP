#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-els19

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/els19/GGA/PMX/7.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/els19/GGA/PMX/7.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/els19.dat gga t 3.61 -ps 60 -c PMX -aux -seed 7 -csvf /tmp -csvs GGA_PMX_7; mv /tmp/objective_value_GGA_PMX_7.csv ./results/paper/els19/GGA/PMX/objective_value_7.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GGA_PMX_7.csv ./results/paper/els19/GGA/PMX/diversity_7.csv; fi

wait $!
