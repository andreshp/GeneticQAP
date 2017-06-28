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
#$ -o ./results/paper/lipa90b/GRASP/2optb/alpha=0.2/1.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/lipa90b/GRASP/2optb/alpha=0.2/1.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/lipa90b.dat grasp t 81.0 -gr ind -ls 2optb -gra 0.2 -seed 1 -csvf /tmp -csvs GRASP_2optb_alpha=0.2_1; mv /tmp/objective_value_GRASP_2optb_alpha=0.2_1.csv ./results/paper/lipa90b/GRASP/2optb/alpha=0.2/objective_value_1.csv

wait $!
