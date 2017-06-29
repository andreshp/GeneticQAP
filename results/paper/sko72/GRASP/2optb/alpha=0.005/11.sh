#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-sko72

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/sko72/GRASP/2optb/alpha=0.005/11.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/sko72/GRASP/2optb/alpha=0.005/11.log

# Set working directory to the current one
#$ -cwd

python ./code/main_ma.py ./instances/sko72.dat grasp t 51.84 -gr ind -ls 2optb -gra 0.005 -aux -seed 11 -csvf /tmp -csvs GRASP_2optb_alpha=0.005_11; mv /tmp/objective_value_GRASP_2optb_alpha=0.005_11.csv ./results/paper/sko72/GRASP/2optb/alpha=0.005/objective_value_11.csv
 if [[ false -eq true ]] then; mv /tmp/diversity_GRASP_2optb_alpha=0.005_11.csv ./results/paper/sko72/GRASP/2optb/alpha=0.005/diversity_11.csv; fi

wait $!
