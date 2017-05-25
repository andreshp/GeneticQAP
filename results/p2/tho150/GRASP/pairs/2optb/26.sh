#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-tho150

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/p2/tho150/GRASP/pairs/2optb/26.sol

# File to wich the error stream is redirected.
#$ -e ./results/p2/tho150/GRASP/pairs/2optb/26.log

# Set working directory to the current one
#$ -cwd

python ./code/main_ma.py ./instances/tho150.dat grasp i 24 -gr pairs -ls 2optb -gra 0.3 -lsme 50000 -seed 26 -csvf /tmp -csvs GRASP_pairs_2optb_26; mv /tmp/objective_value_GRASP_pairs_2optb_26.csv ./results/p2/tho150/GRASP/pairs/2optb/objective_value_26.csv

wait $!
