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
#$ -o ./results/paper/lipa90b/GGA/PMX/26.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/lipa90b/GGA/PMX/26.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/lipa90b.dat gga t 81.0 -ps 60 -c PMX -aux -seed 26 -csvf /tmp -csvs GGA_PMX_26; mv /tmp/objective_value_GGA_PMX_26.csv ./results/paper/lipa90b/GGA/PMX/objective_value_26.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GGA_PMX_26.csv ./results/paper/lipa90b/GGA/PMX/diversity_26.csv; fi

wait $!
