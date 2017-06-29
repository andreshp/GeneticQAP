#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-chr20b

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/chr20b/GRASP/2optb/alpha=0.005/9.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/chr20b/GRASP/2optb/alpha=0.005/9.log

# Set working directory to the current one
#$ -cwd

python ./code/main_ma.py ./instances/chr20b.dat grasp t 4.0 -gr ind -ls 2optb -gra 0.005 -aux -seed 9 -csvf /tmp -csvs GRASP_2optb_alpha=0.005_9; mv /tmp/objective_value_GRASP_2optb_alpha=0.005_9.csv ./results/paper/chr20b/GRASP/2optb/alpha=0.005/objective_value_9.csv
 if [[ false -eq true ]] then; mv /tmp/diversity_GRASP_2optb_alpha=0.005_9.csv ./results/paper/chr20b/GRASP/2optb/alpha=0.005/diversity_9.csv; fi

wait $!
