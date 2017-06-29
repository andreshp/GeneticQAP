#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-nug25

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/nug25/GRASP/2optb/alpha=0.005/22.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/nug25/GRASP/2optb/alpha=0.005/22.log

# Set working directory to the current one
#$ -cwd

python ./code/main_ma.py ./instances/nug25.dat grasp t 6.25 -gr ind -ls 2optb -gra 0.005 -aux -seed 22 -csvf /tmp -csvs GRASP_2optb_alpha=0.005_22; mv /tmp/objective_value_GRASP_2optb_alpha=0.005_22.csv ./results/paper/nug25/GRASP/2optb/alpha=0.005/objective_value_22.csv
 if [[ false -eq true ]] then; mv /tmp/diversity_GRASP_2optb_alpha=0.005_22.csv ./results/paper/nug25/GRASP/2optb/alpha=0.005/diversity_22.csv; fi

wait $!
