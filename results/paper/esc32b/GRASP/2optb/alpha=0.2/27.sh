#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-esc32b

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/esc32b/GRASP/2optb/alpha=0.2/27.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/esc32b/GRASP/2optb/alpha=0.2/27.log

# Set working directory to the current one
#$ -cwd

python ./code/main_ma.py ./instances/esc32b.dat grasp t 0.0001024 -gr ind -ls 2optb -gra 0.2 -aux -seed 27 -csvf /tmp -csvs GRASP_2optb_alpha=0.2_27; mv /tmp/objective_value_GRASP_2optb_alpha=0.2_27.csv ./results/paper/esc32b/GRASP/2optb/alpha=0.2/objective_value_27.csv
 if [[ false -eq true ]] then; mv /tmp/diversity_GRASP_2optb_alpha=0.2_27.csv ./results/paper/esc32b/GRASP/2optb/alpha=0.2/diversity_27.csv; fi

wait $!
