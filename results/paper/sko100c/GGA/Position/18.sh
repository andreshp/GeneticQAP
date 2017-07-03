#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-sko100c

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/sko100c/GGA/Position/18.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/sko100c/GGA/Position/18.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/sko100c.dat gga t 100.0 -ps 60 -c Position -aux -seed 18 -csvf /tmp -csvs GGA_Position_18; mv /tmp/objective_value_GGA_Position_18.csv ./results/paper/sko100c/GGA/Position/objective_value_18.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GGA_Position_18.csv ./results/paper/sko100c/GGA/Position/diversity_18.csv; fi

wait $!
