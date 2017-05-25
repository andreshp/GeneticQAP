#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-esc32b

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/p2/esc32b/GRASP/ind/2optb/12.sol

# File to wich the error stream is redirected.
#$ -e ./results/p2/esc32b/GRASP/ind/2optb/12.log

# Set working directory to the current one
#$ -cwd

python ./code/main_ma.py ./instances/esc32b.dat grasp i 24 -gr ind -ls 2optb -gra 0.3 -lsme 50000 -seed 12 -csvf /tmp -csvs GRASP_ind_2optb_12; mv /tmp/objective_value_GRASP_ind_2optb_12.csv ./results/p2/esc32b/GRASP/ind/2optb/objective_value_12.csv

wait $!
