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
#$ -o ./results/p2/sko56/GRASP/pairs/none/1.sol

# File to wich the error stream is redirected.
#$ -e ./results/p2/sko56/GRASP/pairs/none/1.log

# Set working directory to the current one
#$ -cwd

python ./code/main_ma.py ./instances/sko56.dat grasp i 0 -gr pairs -ls none -gra 0.3 -seed 1 -csvf /tmp -csvs GRASP_pairs_none_1; mv /tmp/objective_value_GRASP_pairs_none_1.csv ./results/p2/sko56/GRASP/pairs/none/objective_value_1.csv

wait $!
