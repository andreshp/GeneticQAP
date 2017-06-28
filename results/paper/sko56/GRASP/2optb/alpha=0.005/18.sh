#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-sko56

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/sko56/GRASP/2optb/alpha=0.005/18.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/sko56/GRASP/2optb/alpha=0.005/18.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/sko56.dat grasp t 31.36 -gr ind -ls 2optb -gra 0.005 -seed 18 -csvf /tmp -csvs GRASP_2optb_alpha=0.005_18; mv /tmp/objective_value_GRASP_2optb_alpha=0.005_18.csv ./results/paper/sko56/GRASP/2optb/alpha=0.005/objective_value_18.csv

wait $!
