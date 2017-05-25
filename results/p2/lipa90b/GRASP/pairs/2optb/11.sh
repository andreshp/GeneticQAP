#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-lipa90b

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/p2/lipa90b/GRASP/pairs/2optb/11.sol

# File to wich the error stream is redirected.
#$ -e ./results/p2/lipa90b/GRASP/pairs/2optb/11.log

# Set working directory to the current one
#$ -cwd

python ./code/main_ma.py ./instances/lipa90b.dat grasp i 24 -gr pairs -ls 2optb -gra 0.3 -lsme 50000 -seed 11 -csvf /tmp -csvs GRASP_pairs_2optb_11; mv /tmp/objective_value_GRASP_pairs_2optb_11.csv ./results/p2/lipa90b/GRASP/pairs/2optb/objective_value_11.csv

wait $!
