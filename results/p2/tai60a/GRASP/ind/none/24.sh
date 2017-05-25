#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-tai60a

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/p2/tai60a/GRASP/ind/none/24.sol

# File to wich the error stream is redirected.
#$ -e ./results/p2/tai60a/GRASP/ind/none/24.log

# Set working directory to the current one
#$ -cwd

python ./code/main_ma.py ./instances/tai60a.dat grasp i 0 -gr ind -ls none -gra 0.3 -seed 24 -csvf /tmp -csvs GRASP_ind_none_24; mv /tmp/objective_value_GRASP_ind_none_24.csv ./results/p2/tai60a/GRASP/ind/none/objective_value_24.csv

wait $!
