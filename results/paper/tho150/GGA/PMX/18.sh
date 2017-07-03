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
#$ -o ./results/paper/tho150/GGA/PMX/18.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/tho150/GGA/PMX/18.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/tho150.dat gga t 225.0 -ps 60 -c PMX -aux -seed 18 -csvf /tmp -csvs GGA_PMX_18; mv /tmp/objective_value_GGA_PMX_18.csv ./results/paper/tho150/GGA/PMX/objective_value_18.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GGA_PMX_18.csv ./results/paper/tho150/GGA/PMX/diversity_18.csv; fi

wait $!
