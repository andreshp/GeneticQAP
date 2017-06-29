#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-esc32b

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/esc32b/GRASP/2optb/alpha=0.2/29.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/esc32b/GRASP/2optb/alpha=0.2/29.log

# Set working directory to the current one
#$ -cwd

python ./code/main_ma.py ./instances/esc32b.dat grasp t 10.24 -gr ind -ls 2optb -gra 0.2 -aux -seed 29 -csvf /tmp -csvs GRASP_2optb_alpha=0.2_29; mv /tmp/objective_value_GRASP_2optb_alpha=0.2_29.csv ./results/paper/esc32b/GRASP/2optb/alpha=0.2/objective_value_29.csv
 if [[ false -eq true ]] then; mv /tmp/diversity_GRASP_2optb_alpha=0.2_29.csv ./results/paper/esc32b/GRASP/2optb/alpha=0.2/diversity_29.csv; fi

wait $!
