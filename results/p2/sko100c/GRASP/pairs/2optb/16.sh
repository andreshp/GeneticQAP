#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-sko100c

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/p2/sko100c/GRASP/pairs/2optb/16.sol

# File to wich the error stream is redirected.
#$ -e ./results/p2/sko100c/GRASP/pairs/2optb/16.log

# Set working directory to the current one
#$ -cwd

python ./code/main_ma.py ./instances/sko100c.dat grasp i 24 -gr pairs -ls 2optb -gra 0.3 -lsme 50000 -seed 16 -csvf /tmp -csvs GRASP_pairs_2optb_16; mv /tmp/objective_value_GRASP_pairs_2optb_16.csv ./results/p2/sko100c/GRASP/pairs/2optb/objective_value_16.csv

wait $!
