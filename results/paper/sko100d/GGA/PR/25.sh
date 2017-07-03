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
#$ -o ./results/paper/sko100d/GGA/PR/25.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/sko100d/GGA/PR/25.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/sko100d.dat gga t 100.0 -ps 60 -c PR -aux -seed 25 -csvf /tmp -csvs GGA_PR_25; mv /tmp/objective_value_GGA_PR_25.csv ./results/paper/sko100d/GGA/PR/objective_value_25.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GGA_PR_25.csv ./results/paper/sko100d/GGA/PR/diversity_25.csv; fi

wait $!
