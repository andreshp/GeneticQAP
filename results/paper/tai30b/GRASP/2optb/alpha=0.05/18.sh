#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-tai30b

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/tai30b/GRASP/2optb/alpha=0.05/18.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/tai30b/GRASP/2optb/alpha=0.05/18.log

# Set working directory to the current one
#$ -cwd

python ./code/main_ma.py ./instances/tai30b.dat grasp t 9.0 -gr ind -ls 2optb -gra 0.05 -aux -seed 18 -csvf /tmp -csvs GRASP_2optb_alpha=0.05_18; mv /tmp/objective_value_GRASP_2optb_alpha=0.05_18.csv ./results/paper/tai30b/GRASP/2optb/alpha=0.05/objective_value_18.csv
 if [[ false -eq true ]] then; mv /tmp/diversity_GRASP_2optb_alpha=0.05_18.csv ./results/paper/tai30b/GRASP/2optb/alpha=0.05/diversity_18.csv; fi

wait $!
