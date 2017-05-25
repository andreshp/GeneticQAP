#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-sko100d

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/p2/sko100d/GRASP/ind/none/23.sol

# File to wich the error stream is redirected.
#$ -e ./results/p2/sko100d/GRASP/ind/none/23.log

# Set working directory to the current one
#$ -cwd

python ./code/main_ma.py ./instances/sko100d.dat grasp i 0 -gr ind -ls none -gra 0.3 -seed 23 -csvf /tmp -csvs GRASP_ind_none_23; mv /tmp/objective_value_GRASP_ind_none_23.csv ./results/p2/sko100d/GRASP/ind/none/objective_value_23.csv

wait $!
