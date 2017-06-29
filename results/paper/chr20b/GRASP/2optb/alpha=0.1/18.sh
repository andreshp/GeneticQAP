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
#$ -o ./results/paper/chr20b/GRASP/2optb/alpha=0.1/18.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/chr20b/GRASP/2optb/alpha=0.1/18.log

# Set working directory to the current one
#$ -cwd

python ./code/main_ma.py ./instances/chr20b.dat grasp t 4.0 -gr ind -ls 2optb -gra 0.1 -aux -seed 18 -csvf /tmp -csvs GRASP_2optb_alpha=0.1_18; mv /tmp/objective_value_GRASP_2optb_alpha=0.1_18.csv ./results/paper/chr20b/GRASP/2optb/alpha=0.1/objective_value_18.csv
 if [[ false -eq true ]] then; mv /tmp/diversity_GRASP_2optb_alpha=0.1_18.csv ./results/paper/chr20b/GRASP/2optb/alpha=0.1/diversity_18.csv; fi

wait $!
