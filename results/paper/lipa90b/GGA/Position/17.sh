#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-lipa90b

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/lipa90b/GGA/Position/17.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/lipa90b/GGA/Position/17.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/lipa90b.dat gga t 81.0 -ps 60 -c Position -aux -seed 17 -csvf /tmp -csvs GGA_Position_17; mv /tmp/objective_value_GGA_Position_17.csv ./results/paper/lipa90b/GGA/Position/objective_value_17.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GGA_Position_17.csv ./results/paper/lipa90b/GGA/Position/diversity_17.csv; fi

wait $!
