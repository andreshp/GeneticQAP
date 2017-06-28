#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-lipa90b

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/lipa90b/GRASP/2optb/alpha=0.005/11.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/lipa90b/GRASP/2optb/alpha=0.005/11.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/lipa90b.dat grasp t 81.0 -gr ind -ls 2optb -gra 0.005 -seed 11 -csvf /tmp -csvs GRASP_2optb_alpha=0.005_11; mv /tmp/objective_value_GRASP_2optb_alpha=0.005_11.csv ./results/paper/lipa90b/GRASP/2optb/alpha=0.005/objective_value_11.csv

wait $!
