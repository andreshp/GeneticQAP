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
#$ -o ./results/paper/tai60a/GRASP/2optb/alpha=0.2/20.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/tai60a/GRASP/2optb/alpha=0.2/20.log

# Set working directory to the current one
#$ -cwd

python ./code/main_ma.py ./instances/tai60a.dat grasp t 36.0 -gr ind -ls 2optb -gra 0.2 -aux -seed 20 -csvf /tmp -csvs GRASP_2optb_alpha=0.2_20; mv /tmp/objective_value_GRASP_2optb_alpha=0.2_20.csv ./results/paper/tai60a/GRASP/2optb/alpha=0.2/objective_value_20.csv
 if [[ false -eq true ]] then; mv /tmp/diversity_GRASP_2optb_alpha=0.2_20.csv ./results/paper/tai60a/GRASP/2optb/alpha=0.2/diversity_20.csv; fi

wait $!
