#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-sko64

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/sko64/GRASP/2optb/alpha=0.2/2.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/sko64/GRASP/2optb/alpha=0.2/2.log

# Set working directory to the current one
#$ -cwd

python ./code/main_ma.py ./instances/sko64.dat grasp t 0.0004096 -gr ind -ls 2optb -gra 0.2 -aux -seed 2 -csvf /tmp -csvs GRASP_2optb_alpha=0.2_2; mv /tmp/objective_value_GRASP_2optb_alpha=0.2_2.csv ./results/paper/sko64/GRASP/2optb/alpha=0.2/objective_value_2.csv
 if [[ false -eq true ]] then; mv /tmp/diversity_GRASP_2optb_alpha=0.2_2.csv ./results/paper/sko64/GRASP/2optb/alpha=0.2/diversity_2.csv; fi

wait $!
