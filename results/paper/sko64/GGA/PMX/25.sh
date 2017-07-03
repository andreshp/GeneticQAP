#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-sko64

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/sko64/GGA/PMX/25.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/sko64/GGA/PMX/25.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/sko64.dat gga t 40.96 -ps 60 -c PMX -aux -seed 25 -csvf /tmp -csvs GGA_PMX_25; mv /tmp/objective_value_GGA_PMX_25.csv ./results/paper/sko64/GGA/PMX/objective_value_25.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GGA_PMX_25.csv ./results/paper/sko64/GGA/PMX/diversity_25.csv; fi

wait $!
