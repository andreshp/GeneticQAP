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
#$ -o ./results/paper/kra30b/GRASP/2optb/alpha=0.05/30.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/kra30b/GRASP/2optb/alpha=0.05/30.log

# Set working directory to the current one
#$ -cwd

python ./code/main_ma.py ./instances/kra30b.dat grasp t 8.999999999999999e-05 -gr ind -ls 2optb -gra 0.05 -aux -seed 30 -csvf /tmp -csvs GRASP_2optb_alpha=0.05_30; mv /tmp/objective_value_GRASP_2optb_alpha=0.05_30.csv ./results/paper/kra30b/GRASP/2optb/alpha=0.05/objective_value_30.csv
 if [[ false -eq true ]] then; mv /tmp/diversity_GRASP_2optb_alpha=0.05_30.csv ./results/paper/kra30b/GRASP/2optb/alpha=0.05/diversity_30.csv; fi

wait $!
