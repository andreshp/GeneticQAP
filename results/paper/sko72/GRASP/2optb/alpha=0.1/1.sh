#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-sko72

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/sko72/GRASP/2optb/alpha=0.1/1.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/sko72/GRASP/2optb/alpha=0.1/1.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/sko72.dat grasp t 51.84 -gr ind -ls 2optb -gra 0.1 -seed 1 -csvf /tmp -csvs GRASP_2optb_alpha=0.1_1; mv /tmp/objective_value_GRASP_2optb_alpha=0.1_1.csv ./results/paper/sko72/GRASP/2optb/alpha=0.1/objective_value_1.csv

wait $!
