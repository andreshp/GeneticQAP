#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-tai256c

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/tai256c/MA/PR/2.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/tai256c/MA/PR/2.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/tai256c.dat gga t 655.36 -ps 60 -c PR -lsga Best -itpls 1 -ls 2optb -aux -seed 2 -csvf /tmp -csvs MA_PR_2; mv /tmp/objective_value_MA_PR_2.csv ./results/paper/tai256c/MA/PR/objective_value_2.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_MA_PR_2.csv ./results/paper/tai256c/MA/PR/diversity_2.csv; fi

wait $!
