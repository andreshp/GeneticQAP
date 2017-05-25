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
#$ -o ./results/p2/sko100d/GRASP/ind/none/26.sol

# File to wich the error stream is redirected.
#$ -e ./results/p2/sko100d/GRASP/ind/none/26.log

# Set working directory to the current one
#$ -cwd

python ./code/main_ma.py ./instances/sko100d.dat grasp i 0 -gr ind -ls none -gra 0.3 -seed 26 -csvf /tmp -csvs GRASP_ind_none_26; mv /tmp/objective_value_GRASP_ind_none_26.csv ./results/p2/sko100d/GRASP/ind/none/objective_value_26.csv

wait $!
