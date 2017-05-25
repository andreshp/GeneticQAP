#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-sko100b

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/p2/sko100b/GRASP/pairs/2optb/24.sol

# File to wich the error stream is redirected.
#$ -e ./results/p2/sko100b/GRASP/pairs/2optb/24.log

# Set working directory to the current one
#$ -cwd

python ./code/main_ma.py ./instances/sko100b.dat grasp i 24 -gr pairs -ls 2optb -gra 0.3 -lsme 50000 -seed 24 -csvf /tmp -csvs GRASP_pairs_2optb_24; mv /tmp/objective_value_GRASP_pairs_2optb_24.csv ./results/p2/sko100b/GRASP/pairs/2optb/objective_value_24.csv

wait $!
