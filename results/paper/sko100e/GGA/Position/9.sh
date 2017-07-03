#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-sko100e

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/sko100e/GGA/Position/9.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/sko100e/GGA/Position/9.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/sko100e.dat gga t 100.0 -ps 60 -c Position -aux -seed 9 -csvf /tmp -csvs GGA_Position_9; mv /tmp/objective_value_GGA_Position_9.csv ./results/paper/sko100e/GGA/Position/objective_value_9.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GGA_Position_9.csv ./results/paper/sko100e/GGA/Position/diversity_9.csv; fi

wait $!
