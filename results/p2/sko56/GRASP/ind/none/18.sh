#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-sko56

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/p2/sko56/GRASP/ind/none/18.sol

# File to wich the error stream is redirected.
#$ -e ./results/p2/sko56/GRASP/ind/none/18.log

# Set working directory to the current one
#$ -cwd

python ./code/main_ma.py ./instances/sko56.dat grasp i 0 -gr ind -ls none -gra 0.3 -seed 18 -csvf /tmp -csvs GRASP_ind_none_18; mv /tmp/objective_value_GRASP_ind_none_18.csv ./results/p2/sko56/GRASP/ind/none/objective_value_18.csv

wait $!
