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
#$ -o ./results/paper/tai60a/GRASP/2optb/alpha=0.005/15.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/tai60a/GRASP/2optb/alpha=0.005/15.log

# Set working directory to the current one
#$ -cwd

python ./code/main_ma.py ./instances/tai60a.dat grasp t 36.0 -gr ind -ls 2optb -gra 0.005 -aux -seed 15 -csvf /tmp -csvs GRASP_2optb_alpha=0.005_15; mv /tmp/objective_value_GRASP_2optb_alpha=0.005_15.csv ./results/paper/tai60a/GRASP/2optb/alpha=0.005/objective_value_15.csv
 if [[ false -eq true ]] then; mv /tmp/diversity_GRASP_2optb_alpha=0.005_15.csv ./results/paper/tai60a/GRASP/2optb/alpha=0.005/diversity_15.csv; fi

wait $!
