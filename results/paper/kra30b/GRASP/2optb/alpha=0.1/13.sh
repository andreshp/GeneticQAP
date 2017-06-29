#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-kra30b

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/kra30b/GRASP/2optb/alpha=0.1/13.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/kra30b/GRASP/2optb/alpha=0.1/13.log

# Set working directory to the current one
#$ -cwd

python ./code/main_ma.py ./instances/kra30b.dat grasp t 9.0 -gr ind -ls 2optb -gra 0.1 -aux -seed 13 -csvf /tmp -csvs GRASP_2optb_alpha=0.1_13; mv /tmp/objective_value_GRASP_2optb_alpha=0.1_13.csv ./results/paper/kra30b/GRASP/2optb/alpha=0.1/objective_value_13.csv
 if [[ false -eq true ]] then; mv /tmp/diversity_GRASP_2optb_alpha=0.1_13.csv ./results/paper/kra30b/GRASP/2optb/alpha=0.1/diversity_13.csv; fi

wait $!
