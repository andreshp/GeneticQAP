#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-tho150

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/tho150/GRASP/2optb/alpha=0.005/3.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/tho150/GRASP/2optb/alpha=0.005/3.log

# Set working directory to the current one
#$ -cwd

python ./code/main_ma.py ./instances/tho150.dat grasp t 0.00225 -gr ind -ls 2optb -gra 0.005 -aux -seed 3 -csvf /tmp -csvs GRASP_2optb_alpha=0.005_3; mv /tmp/objective_value_GRASP_2optb_alpha=0.005_3.csv ./results/paper/tho150/GRASP/2optb/alpha=0.005/objective_value_3.csv
 if [[ false -eq true ]] then; mv /tmp/diversity_GRASP_2optb_alpha=0.005_3.csv ./results/paper/tho150/GRASP/2optb/alpha=0.005/diversity_3.csv; fi

wait $!
