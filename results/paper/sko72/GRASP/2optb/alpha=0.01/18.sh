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
#$ -o ./results/paper/sko72/GRASP/2optb/alpha=0.01/18.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/sko72/GRASP/2optb/alpha=0.01/18.log

# Set working directory to the current one
#$ -cwd

python ./code/main_ma.py ./instances/sko72.dat grasp t 0.0005184 -gr ind -ls 2optb -gra 0.01 -aux -seed 18 -csvf /tmp -csvs GRASP_2optb_alpha=0.01_18; mv /tmp/objective_value_GRASP_2optb_alpha=0.01_18.csv ./results/paper/sko72/GRASP/2optb/alpha=0.01/objective_value_18.csv
 if [[ false -eq true ]] then; mv /tmp/diversity_GRASP_2optb_alpha=0.01_18.csv ./results/paper/sko72/GRASP/2optb/alpha=0.01/diversity_18.csv; fi

wait $!
