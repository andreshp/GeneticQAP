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
#$ -o ./results/paper/sko64/GRASP/2optb/alpha=0.05/28.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/sko64/GRASP/2optb/alpha=0.05/28.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/sko64.dat grasp t 40.96 -gr ind -ls 2optb -gra 0.05 -seed 28 -csvf /tmp -csvs GRASP_2optb_alpha=0.05_28; mv /tmp/objective_value_GRASP_2optb_alpha=0.05_28.csv ./results/paper/sko64/GRASP/2optb/alpha=0.05/objective_value_28.csv

wait $!
