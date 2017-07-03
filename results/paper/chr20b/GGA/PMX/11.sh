#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-chr20b

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/chr20b/GGA/PMX/11.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/chr20b/GGA/PMX/11.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/chr20b.dat gga t 4.0 -ps 60 -c PMX -aux -seed 11 -csvf /tmp -csvs GGA_PMX_11; mv /tmp/objective_value_GGA_PMX_11.csv ./results/paper/chr20b/GGA/PMX/objective_value_11.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GGA_PMX_11.csv ./results/paper/chr20b/GGA/PMX/diversity_11.csv; fi

wait $!
