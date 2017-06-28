#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-sko100a

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/sko100a/GRASP/2optb/alpha=0.005/5.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/sko100a/GRASP/2optb/alpha=0.005/5.log

# Set working directory to the current one
#$ -cwd

python ./code/main_ma.py ./instances/sko100a.dat grasp t 0.001 -gr ind -ls 2optb -gra 0.005 -aux -seed 5 -csvf /tmp -csvs GRASP_2optb_alpha=0.005_5; mv /tmp/objective_value_GRASP_2optb_alpha=0.005_5.csv ./results/paper/sko100a/GRASP/2optb/alpha=0.005/objective_value_5.csv
 if [[ false -eq true ]] then; mv /tmp/diversity_GRASP_2optb_alpha=0.005_5.csv ./results/paper/sko100a/GRASP/2optb/alpha=0.005/diversity_5.csv; fi

wait $!
