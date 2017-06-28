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
#$ -o ./results/paper/sko56/GRASP/2optb/alpha=0.01/5.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/sko56/GRASP/2optb/alpha=0.01/5.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/sko56.dat grasp t 31.36 -gr ind -ls 2optb -gra 0.01 -seed 5 -csvf /tmp -csvs GRASP_2optb_alpha=0.01_5; mv /tmp/objective_value_GRASP_2optb_alpha=0.01_5.csv ./results/paper/sko56/GRASP/2optb/alpha=0.01/objective_value_5.csv

wait $!
