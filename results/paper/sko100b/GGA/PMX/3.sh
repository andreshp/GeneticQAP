#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-sko100b

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/sko100b/GGA/PMX/3.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/sko100b/GGA/PMX/3.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/sko100b.dat gga t 100.0 -ps 60 -c PMX -aux -seed 3 -csvf /tmp -csvs GGA_PMX_3; mv /tmp/objective_value_GGA_PMX_3.csv ./results/paper/sko100b/GGA/PMX/objective_value_3.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GGA_PMX_3.csv ./results/paper/sko100b/GGA/PMX/diversity_3.csv; fi

wait $!
