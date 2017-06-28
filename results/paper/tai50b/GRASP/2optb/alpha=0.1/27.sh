#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-tai50b

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/tai50b/GRASP/2optb/alpha=0.1/27.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/tai50b/GRASP/2optb/alpha=0.1/27.log

# Set working directory to the current one
#$ -cwd

python ./code/main_ma.py ./instances/tai50b.dat grasp t 0.00025 -gr ind -ls 2optb -gra 0.1 -aux -seed 27 -csvf /tmp -csvs GRASP_2optb_alpha=0.1_27; mv /tmp/objective_value_GRASP_2optb_alpha=0.1_27.csv ./results/paper/tai50b/GRASP/2optb/alpha=0.1/objective_value_27.csv
 if [[ false -eq true ]] then; mv /tmp/diversity_GRASP_2optb_alpha=0.1_27.csv ./results/paper/tai50b/GRASP/2optb/alpha=0.1/diversity_27.csv; fi

wait $!
