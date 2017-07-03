#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-sko72

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/sko72/GGA/PMX/23.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/sko72/GGA/PMX/23.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/sko72.dat gga t 51.84 -ps 60 -c PMX -aux -seed 23 -csvf /tmp -csvs GGA_PMX_23; mv /tmp/objective_value_GGA_PMX_23.csv ./results/paper/sko72/GGA/PMX/objective_value_23.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GGA_PMX_23.csv ./results/paper/sko72/GGA/PMX/diversity_23.csv; fi

wait $!
