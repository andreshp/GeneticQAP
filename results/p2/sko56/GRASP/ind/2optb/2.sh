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
#$ -o ./results/p2/sko56/GRASP/ind/2optb/2.sol

# File to wich the error stream is redirected.
#$ -e ./results/p2/sko56/GRASP/ind/2optb/2.log

# Set working directory to the current one
#$ -cwd

python ./code/main_ma.py ./instances/sko56.dat grasp i 24 -gr ind -ls 2optb -gra 0.3 -lsme 50000 -seed 2 -csvf /tmp -csvs GRASP_ind_2optb_2; mv /tmp/objective_value_GRASP_ind_2optb_2.csv ./results/p2/sko56/GRASP/ind/2optb/objective_value_2.csv

wait $!
