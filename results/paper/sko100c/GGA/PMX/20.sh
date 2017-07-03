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
#$ -o ./results/paper/sko100c/GGA/PMX/20.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/sko100c/GGA/PMX/20.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/sko100c.dat gga t 100.0 -ps 60 -c PMX -aux -seed 20 -csvf /tmp -csvs GGA_PMX_20; mv /tmp/objective_value_GGA_PMX_20.csv ./results/paper/sko100c/GGA/PMX/objective_value_20.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GGA_PMX_20.csv ./results/paper/sko100c/GGA/PMX/diversity_20.csv; fi

wait $!
