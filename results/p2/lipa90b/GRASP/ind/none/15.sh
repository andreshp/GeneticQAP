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
#$ -o ./results/p2/lipa90b/GRASP/ind/none/15.sol

# File to wich the error stream is redirected.
#$ -e ./results/p2/lipa90b/GRASP/ind/none/15.log

# Set working directory to the current one
#$ -cwd

python ./code/main_ma.py ./instances/lipa90b.dat grasp i 0 -gr ind -ls none -gra 0.3 -seed 15 -csvf /tmp -csvs GRASP_ind_none_15; mv /tmp/objective_value_GRASP_ind_none_15.csv ./results/p2/lipa90b/GRASP/ind/none/objective_value_15.csv

wait $!
