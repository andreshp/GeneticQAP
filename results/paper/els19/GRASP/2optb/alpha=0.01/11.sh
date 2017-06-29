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
#$ -o ./results/paper/els19/GRASP/2optb/alpha=0.01/11.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/els19/GRASP/2optb/alpha=0.01/11.log

# Set working directory to the current one
#$ -cwd

python ./code/main_ma.py ./instances/els19.dat grasp t 3.61 -gr ind -ls 2optb -gra 0.01 -aux -seed 11 -csvf /tmp -csvs GRASP_2optb_alpha=0.01_11; mv /tmp/objective_value_GRASP_2optb_alpha=0.01_11.csv ./results/paper/els19/GRASP/2optb/alpha=0.01/objective_value_11.csv
 if [[ false -eq true ]] then; mv /tmp/diversity_GRASP_2optb_alpha=0.01_11.csv ./results/paper/els19/GRASP/2optb/alpha=0.01/diversity_11.csv; fi

wait $!
