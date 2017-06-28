#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-chr22a

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/chr22a/GRASP/2optb/alpha=0.05/14.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/chr22a/GRASP/2optb/alpha=0.05/14.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/chr22a.dat grasp t 4.84 -gr ind -ls 2optb -gra 0.05 -seed 14 -csvf /tmp -csvs GRASP_2optb_alpha=0.05_14; mv /tmp/objective_value_GRASP_2optb_alpha=0.05_14.csv ./results/paper/chr22a/GRASP/2optb/alpha=0.05/objective_value_14.csv

wait $!
