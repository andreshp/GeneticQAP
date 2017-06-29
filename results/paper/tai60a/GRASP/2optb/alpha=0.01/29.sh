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
#$ -o ./results/paper/tai60a/GRASP/2optb/alpha=0.01/29.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/tai60a/GRASP/2optb/alpha=0.01/29.log

# Set working directory to the current one
#$ -cwd

python ./code/main_ma.py ./instances/tai60a.dat grasp t 36.0 -gr ind -ls 2optb -gra 0.01 -aux -seed 29 -csvf /tmp -csvs GRASP_2optb_alpha=0.01_29; mv /tmp/objective_value_GRASP_2optb_alpha=0.01_29.csv ./results/paper/tai60a/GRASP/2optb/alpha=0.01/objective_value_29.csv
 if [[ false -eq true ]] then; mv /tmp/diversity_GRASP_2optb_alpha=0.01_29.csv ./results/paper/tai60a/GRASP/2optb/alpha=0.01/diversity_29.csv; fi

wait $!
