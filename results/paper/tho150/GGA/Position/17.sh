#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-tho150

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/tho150/GGA/Position/17.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/tho150/GGA/Position/17.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/tho150.dat gga t 225.0 -ps 60 -c Position -aux -seed 17 -csvf /tmp -csvs GGA_Position_17; mv /tmp/objective_value_GGA_Position_17.csv ./results/paper/tho150/GGA/Position/objective_value_17.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GGA_Position_17.csv ./results/paper/tho150/GGA/Position/diversity_17.csv; fi

wait $!
