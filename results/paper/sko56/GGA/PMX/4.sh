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
#$ -o ./results/paper/sko56/GGA/PMX/4.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/sko56/GGA/PMX/4.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/sko56.dat gga t 31.36 -ps 60 -c PMX -aux -seed 4 -csvf /tmp -csvs GGA_PMX_4; mv /tmp/objective_value_GGA_PMX_4.csv ./results/paper/sko56/GGA/PMX/objective_value_4.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GGA_PMX_4.csv ./results/paper/sko56/GGA/PMX/diversity_4.csv; fi

wait $!
