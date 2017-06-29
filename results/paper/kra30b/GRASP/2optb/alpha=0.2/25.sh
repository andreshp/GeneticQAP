#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-kra30b

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/kra30b/GRASP/2optb/alpha=0.2/25.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/kra30b/GRASP/2optb/alpha=0.2/25.log

# Set working directory to the current one
#$ -cwd

python ./code/main_ma.py ./instances/kra30b.dat grasp t 9.0 -gr ind -ls 2optb -gra 0.2 -aux -seed 25 -csvf /tmp -csvs GRASP_2optb_alpha=0.2_25; mv /tmp/objective_value_GRASP_2optb_alpha=0.2_25.csv ./results/paper/kra30b/GRASP/2optb/alpha=0.2/objective_value_25.csv
 if [[ false -eq true ]] then; mv /tmp/diversity_GRASP_2optb_alpha=0.2_25.csv ./results/paper/kra30b/GRASP/2optb/alpha=0.2/diversity_25.csv; fi

wait $!
