#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-sko100b

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/sko100b/GRASP/2optb/alpha=0.05/13.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/sko100b/GRASP/2optb/alpha=0.05/13.log

# Set working directory to the current one
#$ -cwd

python ./code/main_ma.py ./instances/sko100b.dat grasp t 100.0 -gr ind -ls 2optb -gra 0.05 -aux -seed 13 -csvf /tmp -csvs GRASP_2optb_alpha=0.05_13; mv /tmp/objective_value_GRASP_2optb_alpha=0.05_13.csv ./results/paper/sko100b/GRASP/2optb/alpha=0.05/objective_value_13.csv
 if [[ false -eq true ]] then; mv /tmp/diversity_GRASP_2optb_alpha=0.05_13.csv ./results/paper/sko100b/GRASP/2optb/alpha=0.05/diversity_13.csv; fi

wait $!
