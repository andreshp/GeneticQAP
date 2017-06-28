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
#$ -o ./results/paper/tai30b/GRASP/2optb/alpha=0.05/26.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/tai30b/GRASP/2optb/alpha=0.05/26.log

# Set working directory to the current one
#$ -cwd

python ./code/main_ma.py ./instances/tai30b.dat grasp t 8.999999999999999e-05 -gr ind -ls 2optb -gra 0.05 -aux -seed 26 -csvf /tmp -csvs GRASP_2optb_alpha=0.05_26; mv /tmp/objective_value_GRASP_2optb_alpha=0.05_26.csv ./results/paper/tai30b/GRASP/2optb/alpha=0.05/objective_value_26.csv
 if [[ false -eq true ]] then; mv /tmp/diversity_GRASP_2optb_alpha=0.05_26.csv ./results/paper/tai30b/GRASP/2optb/alpha=0.05/diversity_26.csv; fi

wait $!
