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
#$ -o ./results/paper/tai30b/GRASP/2optb/alpha=0.01/20.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/tai30b/GRASP/2optb/alpha=0.01/20.log

# Set working directory to the current one
#$ -cwd

python ./code/main_ma.py ./instances/tai30b.dat grasp t 9.0 -gr ind -ls 2optb -gra 0.01 -aux -seed 20 -csvf /tmp -csvs GRASP_2optb_alpha=0.01_20; mv /tmp/objective_value_GRASP_2optb_alpha=0.01_20.csv ./results/paper/tai30b/GRASP/2optb/alpha=0.01/objective_value_20.csv
 if [[ false -eq true ]] then; mv /tmp/diversity_GRASP_2optb_alpha=0.01_20.csv ./results/paper/tai30b/GRASP/2optb/alpha=0.01/diversity_20.csv; fi

wait $!
