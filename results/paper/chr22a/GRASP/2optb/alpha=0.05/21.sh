#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-chr22a

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/chr22a/GRASP/2optb/alpha=0.05/21.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/chr22a/GRASP/2optb/alpha=0.05/21.log

# Set working directory to the current one
#$ -cwd

python ./code/main_ma.py ./instances/chr22a.dat grasp t 4.84e-05 -gr ind -ls 2optb -gra 0.05 -aux -seed 21 -csvf /tmp -csvs GRASP_2optb_alpha=0.05_21; mv /tmp/objective_value_GRASP_2optb_alpha=0.05_21.csv ./results/paper/chr22a/GRASP/2optb/alpha=0.05/objective_value_21.csv
 if [[ false -eq true ]] then; mv /tmp/diversity_GRASP_2optb_alpha=0.05_21.csv ./results/paper/chr22a/GRASP/2optb/alpha=0.05/diversity_21.csv; fi

wait $!
