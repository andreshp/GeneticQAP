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
#$ -o ./results/p2/sko100d/GRASP/ind/2optb/6.sol

# File to wich the error stream is redirected.
#$ -e ./results/p2/sko100d/GRASP/ind/2optb/6.log

# Set working directory to the current one
#$ -cwd

python ./code/main_ma.py ./instances/sko100d.dat grasp i 24 -gr ind -ls 2optb -gra 0.3 -lsme 50000 -seed 6 -csvf /tmp -csvs GRASP_ind_2optb_6; mv /tmp/objective_value_GRASP_ind_2optb_6.csv ./results/p2/sko100d/GRASP/ind/2optb/objective_value_6.csv

wait $!
