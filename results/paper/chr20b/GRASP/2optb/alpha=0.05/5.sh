#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-chr20b

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/chr20b/GRASP/2optb/alpha=0.05/5.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/chr20b/GRASP/2optb/alpha=0.05/5.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/chr20b.dat grasp t 4.0 -gr ind -ls 2optb -gra 0.05 -seed 5 -csvf /tmp -csvs GRASP_2optb_alpha=0.05_5; mv /tmp/objective_value_GRASP_2optb_alpha=0.05_5.csv ./results/paper/chr20b/GRASP/2optb/alpha=0.05/objective_value_5.csv

wait $!
