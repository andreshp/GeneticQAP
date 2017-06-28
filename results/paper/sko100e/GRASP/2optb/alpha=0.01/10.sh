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
#$ -o ./results/paper/sko100e/GRASP/2optb/alpha=0.01/10.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/sko100e/GRASP/2optb/alpha=0.01/10.log

# Set working directory to the current one
#$ -cwd

python ./code/main_ma.py ./instances/sko100e.dat grasp t 0.001 -gr ind -ls 2optb -gra 0.01 -aux -seed 10 -csvf /tmp -csvs GRASP_2optb_alpha=0.01_10; mv /tmp/objective_value_GRASP_2optb_alpha=0.01_10.csv ./results/paper/sko100e/GRASP/2optb/alpha=0.01/objective_value_10.csv
 if [[ false -eq true ]] then; mv /tmp/diversity_GRASP_2optb_alpha=0.01_10.csv ./results/paper/sko100e/GRASP/2optb/alpha=0.01/diversity_10.csv; fi

wait $!
