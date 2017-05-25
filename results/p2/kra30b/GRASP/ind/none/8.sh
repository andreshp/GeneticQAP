#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-kra30b

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/p2/kra30b/GRASP/ind/none/8.sol

# File to wich the error stream is redirected.
#$ -e ./results/p2/kra30b/GRASP/ind/none/8.log

# Set working directory to the current one
#$ -cwd

python ./code/main_ma.py ./instances/kra30b.dat grasp i 0 -gr ind -ls none -gra 0.3 -seed 8 -csvf /tmp -csvs GRASP_ind_none_8; mv /tmp/objective_value_GRASP_ind_none_8.csv ./results/p2/kra30b/GRASP/ind/none/objective_value_8.csv

wait $!
