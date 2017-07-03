#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-tai60a

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/tai60a/MA/PR/23.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/tai60a/MA/PR/23.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/tai60a.dat gga t 36.0 -ps 60 -c PR -lsga Best -itpls 1 -ls 2optb -aux -seed 23 -csvf /tmp -csvs MA_PR_23; mv /tmp/objective_value_MA_PR_23.csv ./results/paper/tai60a/MA/PR/objective_value_23.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_MA_PR_23.csv ./results/paper/tai60a/MA/PR/diversity_23.csv; fi

wait $!
