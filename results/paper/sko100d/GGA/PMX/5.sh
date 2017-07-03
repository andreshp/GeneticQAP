#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-sko100d

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/sko100d/GGA/PMX/5.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/sko100d/GGA/PMX/5.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/sko100d.dat gga t 100.0 -ps 60 -c PMX -aux -seed 5 -csvf /tmp -csvs GGA_PMX_5; mv /tmp/objective_value_GGA_PMX_5.csv ./results/paper/sko100d/GGA/PMX/objective_value_5.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GGA_PMX_5.csv ./results/paper/sko100d/GGA/PMX/diversity_5.csv; fi

wait $!
