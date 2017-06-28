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
#$ -o ./results/paper/esc32b/GRASP/2optb/alpha=0.01/16.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/esc32b/GRASP/2optb/alpha=0.01/16.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/esc32b.dat grasp t 10.24 -gr ind -ls 2optb -gra 0.01 -seed 16 -csvf /tmp -csvs GRASP_2optb_alpha=0.01_16; mv /tmp/objective_value_GRASP_2optb_alpha=0.01_16.csv ./results/paper/esc32b/GRASP/2optb/alpha=0.01/objective_value_16.csv

wait $!
