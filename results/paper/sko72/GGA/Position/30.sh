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
#$ -o ./results/paper/sko72/GGA/Position/30.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/sko72/GGA/Position/30.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/sko72.dat gga t 51.84 -ps 60 -c Position -aux -seed 30 -csvf /tmp -csvs GGA_Position_30; mv /tmp/objective_value_GGA_Position_30.csv ./results/paper/sko72/GGA/Position/objective_value_30.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GGA_Position_30.csv ./results/paper/sko72/GGA/Position/diversity_30.csv; fi

wait $!
