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
#$ -o ./results/p2/sko100d/GRASP/pairs/none/28.sol

# File to wich the error stream is redirected.
#$ -e ./results/p2/sko100d/GRASP/pairs/none/28.log

# Set working directory to the current one
#$ -cwd

python ./code/main_ma.py ./instances/sko100d.dat grasp i 0 -gr pairs -ls none -gra 0.3 -seed 28 -csvf /tmp -csvs GRASP_pairs_none_28; mv /tmp/objective_value_GRASP_pairs_none_28.csv ./results/p2/sko100d/GRASP/pairs/none/objective_value_28.csv

wait $!
