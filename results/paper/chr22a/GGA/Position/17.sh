#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-chr22a

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/chr22a/GGA/Position/17.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/chr22a/GGA/Position/17.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/chr22a.dat gga t 4.84 -ps 60 -c Position -aux -seed 17 -csvf /tmp -csvs GGA_Position_17; mv /tmp/objective_value_GGA_Position_17.csv ./results/paper/chr22a/GGA/Position/objective_value_17.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GGA_Position_17.csv ./results/paper/chr22a/GGA/Position/diversity_17.csv; fi

wait $!
