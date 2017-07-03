#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-sko56

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/sko56/GGA/Position/2.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/sko56/GGA/Position/2.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/sko56.dat gga t 31.36 -ps 60 -c Position -aux -seed 2 -csvf /tmp -csvs GGA_Position_2; mv /tmp/objective_value_GGA_Position_2.csv ./results/paper/sko56/GGA/Position/objective_value_2.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GGA_Position_2.csv ./results/paper/sko56/GGA/Position/diversity_2.csv; fi

wait $!
