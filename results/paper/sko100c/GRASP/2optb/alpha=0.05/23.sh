#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-sko100c

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/sko100c/GRASP/2optb/alpha=0.05/23.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/sko100c/GRASP/2optb/alpha=0.05/23.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/sko100c.dat grasp t 100.0 -gr ind -ls 2optb -gra 0.05 -seed 23 -csvf /tmp -csvs GRASP_2optb_alpha=0.05_23; mv /tmp/objective_value_GRASP_2optb_alpha=0.05_23.csv ./results/paper/sko100c/GRASP/2optb/alpha=0.05/objective_value_23.csv

wait $!
