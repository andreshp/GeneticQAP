#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-tai60a

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/p2/tai60a/GRASP/pairs/none/14.sol

# File to wich the error stream is redirected.
#$ -e ./results/p2/tai60a/GRASP/pairs/none/14.log

# Set working directory to the current one
#$ -cwd

python ./code/main_ma.py ./instances/tai60a.dat grasp i 0 -gr pairs -ls none -gra 0.3 -seed 14 -csvf /tmp -csvs GRASP_pairs_none_14; mv /tmp/objective_value_GRASP_pairs_none_14.csv ./results/p2/tai60a/GRASP/pairs/none/objective_value_14.csv

wait $!
