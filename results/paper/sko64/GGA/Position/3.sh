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
#$ -o ./results/paper/sko64/GGA/Position/3.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/sko64/GGA/Position/3.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/sko64.dat gga t 40.96 -ps 60 -c Position -aux -seed 3 -csvf /tmp -csvs GGA_Position_3; mv /tmp/objective_value_GGA_Position_3.csv ./results/paper/sko64/GGA/Position/objective_value_3.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GGA_Position_3.csv ./results/paper/sko64/GGA/Position/diversity_3.csv; fi

wait $!
