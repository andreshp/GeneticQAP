#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-esc32b

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/esc32b/GGA/Position/20.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/esc32b/GGA/Position/20.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/esc32b.dat gga t 10.24 -ps 60 -c Position -aux -seed 20 -csvf /tmp -csvs GGA_Position_20; mv /tmp/objective_value_GGA_Position_20.csv ./results/paper/esc32b/GGA/Position/objective_value_20.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GGA_Position_20.csv ./results/paper/esc32b/GGA/Position/diversity_20.csv; fi

wait $!
