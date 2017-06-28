#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-tai256c

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/tai256c/GRASP/2optb/alpha=0.01/19.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/tai256c/GRASP/2optb/alpha=0.01/19.log

# Set working directory to the current one
#$ -cwd

python ./code/main_ma.py ./instances/tai256c.dat grasp t 0.0065536 -gr ind -ls 2optb -gra 0.01 -aux -seed 19 -csvf /tmp -csvs GRASP_2optb_alpha=0.01_19; mv /tmp/objective_value_GRASP_2optb_alpha=0.01_19.csv ./results/paper/tai256c/GRASP/2optb/alpha=0.01/objective_value_19.csv
 if [[ false -eq true ]] then; mv /tmp/diversity_GRASP_2optb_alpha=0.01_19.csv ./results/paper/tai256c/GRASP/2optb/alpha=0.01/diversity_19.csv; fi

wait $!
