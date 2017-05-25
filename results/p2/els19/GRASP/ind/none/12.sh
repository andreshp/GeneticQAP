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
#$ -o ./results/p2/els19/GRASP/ind/none/12.sol

# File to wich the error stream is redirected.
#$ -e ./results/p2/els19/GRASP/ind/none/12.log

# Set working directory to the current one
#$ -cwd

python ./code/main_ma.py ./instances/els19.dat grasp i 0 -gr ind -ls none -gra 0.3 -seed 12 -csvf /tmp -csvs GRASP_ind_none_12; mv /tmp/objective_value_GRASP_ind_none_12.csv ./results/p2/els19/GRASP/ind/none/objective_value_12.csv

wait $!
