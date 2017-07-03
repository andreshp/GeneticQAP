#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-sko100a

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/sko100a/GGA/Position/5.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/sko100a/GGA/Position/5.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/sko100a.dat gga t 100.0 -ps 60 -c Position -aux -seed 5 -csvf /tmp -csvs GGA_Position_5; mv /tmp/objective_value_GGA_Position_5.csv ./results/paper/sko100a/GGA/Position/objective_value_5.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GGA_Position_5.csv ./results/paper/sko100a/GGA/Position/diversity_5.csv; fi

wait $!
