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
#$ -o ./results/p2/chr22a/GRASP/ind/none/17.sol

# File to wich the error stream is redirected.
#$ -e ./results/p2/chr22a/GRASP/ind/none/17.log

# Set working directory to the current one
#$ -cwd

python ./code/main_ma.py ./instances/chr22a.dat grasp i 0 -gr ind -ls none -gra 0.3 -seed 17 -csvf /tmp -csvs GRASP_ind_none_17; mv /tmp/objective_value_GRASP_ind_none_17.csv ./results/p2/chr22a/GRASP/ind/none/objective_value_17.csv

wait $!
