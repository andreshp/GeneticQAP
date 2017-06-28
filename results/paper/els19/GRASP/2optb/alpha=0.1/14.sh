#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-els19

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/els19/GRASP/2optb/alpha=0.1/14.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/els19/GRASP/2optb/alpha=0.1/14.log

# Set working directory to the current one
#$ -cwd

python ./code/main_ma.py ./instances/els19.dat grasp t 3.6099999999999997e-05 -gr ind -ls 2optb -gra 0.1 -aux -seed 14 -csvf /tmp -csvs GRASP_2optb_alpha=0.1_14; mv /tmp/objective_value_GRASP_2optb_alpha=0.1_14.csv ./results/paper/els19/GRASP/2optb/alpha=0.1/objective_value_14.csv
 if [[ false -eq true ]] then; mv /tmp/diversity_GRASP_2optb_alpha=0.1_14.csv ./results/paper/els19/GRASP/2optb/alpha=0.1/diversity_14.csv; fi

wait $!
