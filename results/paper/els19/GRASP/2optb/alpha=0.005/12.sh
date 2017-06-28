#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-els19

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/els19/GRASP/2optb/alpha=0.005/12.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/els19/GRASP/2optb/alpha=0.005/12.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/els19.dat grasp t 3.61 -gr ind -ls 2optb -gra 0.005 -seed 12 -csvf /tmp -csvs GRASP_2optb_alpha=0.005_12; mv /tmp/objective_value_GRASP_2optb_alpha=0.005_12.csv ./results/paper/els19/GRASP/2optb/alpha=0.005/objective_value_12.csv

wait $!
