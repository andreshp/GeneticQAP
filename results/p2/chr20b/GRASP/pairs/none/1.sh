#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-chr20b

# Queue for the job.
#$ -q media

# File to wich the output is redirected.
#$ -o ./results/p2/chr20b/GRASP/pairs/none/1.sol

# File to wich the error stream is redirected.
#$ -e ./results/p2/chr20b/GRASP/pairs/none/1.log

# Set working directory to the current one
#$ -cwd

python ./code/main_ma.py ./instances/chr20b.dat grasp i 0 -gr pairs -ls none -gra 0.3 -csv -seed 1; mv /tmp/objective_value.csv ./results/p2/chr20b/GRASP/pairs/none/objective_value_1.csv

wait $!
