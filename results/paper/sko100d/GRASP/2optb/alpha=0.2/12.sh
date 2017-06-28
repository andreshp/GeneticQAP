#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-sko100d

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/sko100d/GRASP/2optb/alpha=0.2/12.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/sko100d/GRASP/2optb/alpha=0.2/12.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/sko100d.dat grasp t 100.0 -gr ind -ls 2optb -gra 0.2 -seed 12 -csvf /tmp -csvs GRASP_2optb_alpha=0.2_12; mv /tmp/objective_value_GRASP_2optb_alpha=0.2_12.csv ./results/paper/sko100d/GRASP/2optb/alpha=0.2/objective_value_12.csv

wait $!
