#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-sko100a

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/sko100a/GRASP/2optb/alpha=0.2/27.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/sko100a/GRASP/2optb/alpha=0.2/27.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/sko100a.dat grasp t 100.0 -gr ind -ls 2optb -gra 0.2 -seed 27 -csvf /tmp -csvs GRASP_2optb_alpha=0.2_27; mv /tmp/objective_value_GRASP_2optb_alpha=0.2_27.csv ./results/paper/sko100a/GRASP/2optb/alpha=0.2/objective_value_27.csv

wait $!
