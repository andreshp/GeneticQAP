#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-kra30b

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/kra30b/GRASP/2optb/alpha=0.01/20.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/kra30b/GRASP/2optb/alpha=0.01/20.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/kra30b.dat grasp t 9.0 -gr ind -ls 2optb -gra 0.01 -seed 20 -csvf /tmp -csvs GRASP_2optb_alpha=0.01_20; mv /tmp/objective_value_GRASP_2optb_alpha=0.01_20.csv ./results/paper/kra30b/GRASP/2optb/alpha=0.01/objective_value_20.csv

wait $!
