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
#$ -o ./results/paper/tai60a/GRASP/2optb/alpha=0.1/10.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/tai60a/GRASP/2optb/alpha=0.1/10.log

# Set working directory to the current one
#$ -cwd

python ./code/main_ma.py ./instances/tai60a.dat grasp t 0.00035999999999999997 -gr ind -ls 2optb -gra 0.1 -aux -seed 10 -csvf /tmp -csvs GRASP_2optb_alpha=0.1_10; mv /tmp/objective_value_GRASP_2optb_alpha=0.1_10.csv ./results/paper/tai60a/GRASP/2optb/alpha=0.1/objective_value_10.csv
 if [[ false -eq true ]] then; mv /tmp/diversity_GRASP_2optb_alpha=0.1_10.csv ./results/paper/tai60a/GRASP/2optb/alpha=0.1/diversity_10.csv; fi

wait $!
