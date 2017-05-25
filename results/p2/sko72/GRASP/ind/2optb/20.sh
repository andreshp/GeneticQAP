#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-sko72

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/p2/sko72/GRASP/ind/2optb/20.sol

# File to wich the error stream is redirected.
#$ -e ./results/p2/sko72/GRASP/ind/2optb/20.log

# Set working directory to the current one
#$ -cwd

python ./code/main_ma.py ./instances/sko72.dat grasp i 24 -gr ind -ls 2optb -gra 0.3 -lsme 50000 -seed 20 -csvf /tmp -csvs GRASP_ind_2optb_20; mv /tmp/objective_value_GRASP_ind_2optb_20.csv ./results/p2/sko72/GRASP/ind/2optb/objective_value_20.csv

wait $!
