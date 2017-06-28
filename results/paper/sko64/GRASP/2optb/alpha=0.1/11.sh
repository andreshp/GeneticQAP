#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-sko64

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/sko64/GRASP/2optb/alpha=0.1/11.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/sko64/GRASP/2optb/alpha=0.1/11.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/sko64.dat grasp t 40.96 -gr ind -ls 2optb -gra 0.1 -seed 11 -csvf /tmp -csvs GRASP_2optb_alpha=0.1_11; mv /tmp/objective_value_GRASP_2optb_alpha=0.1_11.csv ./results/paper/sko64/GRASP/2optb/alpha=0.1/objective_value_11.csv

wait $!
