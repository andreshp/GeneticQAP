#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-nug25

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/p2/nug25/GRASP/pairs/2optb/25.sol

# File to wich the error stream is redirected.
#$ -e ./results/p2/nug25/GRASP/pairs/2optb/25.log

# Set working directory to the current one
#$ -cwd

python ./code/main_ma.py ./instances/nug25.dat grasp i 24 -gr pairs -ls 2optb -gra 0.3 -lsme 50000 -seed 25 -csvf /tmp -csvs GRASP_pairs_2optb_25; mv /tmp/objective_value_GRASP_pairs_2optb_25.csv ./results/p2/nug25/GRASP/pairs/2optb/objective_value_25.csv

wait $!
