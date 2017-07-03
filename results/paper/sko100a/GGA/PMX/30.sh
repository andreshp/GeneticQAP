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
#$ -o ./results/paper/sko100a/GGA/PMX/30.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/sko100a/GGA/PMX/30.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/sko100a.dat gga t 100.0 -ps 60 -c PMX -aux -seed 30 -csvf /tmp -csvs GGA_PMX_30; mv /tmp/objective_value_GGA_PMX_30.csv ./results/paper/sko100a/GGA/PMX/objective_value_30.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GGA_PMX_30.csv ./results/paper/sko100a/GGA/PMX/diversity_30.csv; fi

wait $!
