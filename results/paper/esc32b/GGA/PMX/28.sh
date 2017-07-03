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
#$ -o ./results/paper/esc32b/GGA/PMX/28.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/esc32b/GGA/PMX/28.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/esc32b.dat gga t 10.24 -ps 60 -c PMX -aux -seed 28 -csvf /tmp -csvs GGA_PMX_28; mv /tmp/objective_value_GGA_PMX_28.csv ./results/paper/esc32b/GGA/PMX/objective_value_28.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GGA_PMX_28.csv ./results/paper/esc32b/GGA/PMX/diversity_28.csv; fi

wait $!
