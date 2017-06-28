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
#$ -o ./results/paper/tho150/GRASP/2optb/alpha=0.1/12.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/tho150/GRASP/2optb/alpha=0.1/12.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/tho150.dat grasp t 225.0 -gr ind -ls 2optb -gra 0.1 -seed 12 -csvf /tmp -csvs GRASP_2optb_alpha=0.1_12; mv /tmp/objective_value_GRASP_2optb_alpha=0.1_12.csv ./results/paper/tho150/GRASP/2optb/alpha=0.1/objective_value_12.csv

wait $!
