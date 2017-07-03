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
#$ -o ./results/paper/chr22a/GGA/PMX/22.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/chr22a/GGA/PMX/22.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/chr22a.dat gga t 4.84 -ps 60 -c PMX -aux -seed 22 -csvf /tmp -csvs GGA_PMX_22; mv /tmp/objective_value_GGA_PMX_22.csv ./results/paper/chr22a/GGA/PMX/objective_value_22.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GGA_PMX_22.csv ./results/paper/chr22a/GGA/PMX/diversity_22.csv; fi

wait $!
