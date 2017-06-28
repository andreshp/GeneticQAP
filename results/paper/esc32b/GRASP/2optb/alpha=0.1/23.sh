#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-esc32b

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/esc32b/GRASP/2optb/alpha=0.1/23.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/esc32b/GRASP/2optb/alpha=0.1/23.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/esc32b.dat grasp t 10.24 -gr ind -ls 2optb -gra 0.1 -seed 23 -csvf /tmp -csvs GRASP_2optb_alpha=0.1_23; mv /tmp/objective_value_GRASP_2optb_alpha=0.1_23.csv ./results/paper/esc32b/GRASP/2optb/alpha=0.1/objective_value_23.csv

wait $!
