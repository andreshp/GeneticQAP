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
#$ -o ./results/paper/tho150/GGA/PR/3.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/tho150/GGA/PR/3.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/tho150.dat gga t 225.0 -ps 60 -c PR -aux -seed 3 -csvf /tmp -csvs GGA_PR_3; mv /tmp/objective_value_GGA_PR_3.csv ./results/paper/tho150/GGA/PR/objective_value_3.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GGA_PR_3.csv ./results/paper/tho150/GGA/PR/diversity_3.csv; fi

wait $!
