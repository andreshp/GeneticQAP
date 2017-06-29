#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-sko100e

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/sko100e/GRASP/2optb/alpha=0.01/4.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/sko100e/GRASP/2optb/alpha=0.01/4.log

# Set working directory to the current one
#$ -cwd

python ./code/main_ma.py ./instances/sko100e.dat grasp t 100.0 -gr ind -ls 2optb -gra 0.01 -aux -seed 4 -csvf /tmp -csvs GRASP_2optb_alpha=0.01_4; mv /tmp/objective_value_GRASP_2optb_alpha=0.01_4.csv ./results/paper/sko100e/GRASP/2optb/alpha=0.01/objective_value_4.csv
 if [[ false -eq true ]] then; mv /tmp/diversity_GRASP_2optb_alpha=0.01_4.csv ./results/paper/sko100e/GRASP/2optb/alpha=0.01/diversity_4.csv; fi

wait $!
