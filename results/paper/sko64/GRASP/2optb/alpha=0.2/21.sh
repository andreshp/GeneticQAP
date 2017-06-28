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
#$ -o ./results/paper/sko64/GRASP/2optb/alpha=0.2/21.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/sko64/GRASP/2optb/alpha=0.2/21.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/sko64.dat grasp t 40.96 -gr ind -ls 2optb -gra 0.2 -seed 21 -csvf /tmp -csvs GRASP_2optb_alpha=0.2_21; mv /tmp/objective_value_GRASP_2optb_alpha=0.2_21.csv ./results/paper/sko64/GRASP/2optb/alpha=0.2/objective_value_21.csv

wait $!
