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
#$ -o ./results/paper/els19/GGA/PMX/6.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/els19/GGA/PMX/6.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/els19.dat gga t 3.61 -ps 60 -c PMX -aux -seed 6 -csvf /tmp -csvs GGA_PMX_6; mv /tmp/objective_value_GGA_PMX_6.csv ./results/paper/els19/GGA/PMX/objective_value_6.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GGA_PMX_6.csv ./results/paper/els19/GGA/PMX/diversity_6.csv; fi

wait $!
