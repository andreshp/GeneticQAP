#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-tai50b

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/tai50b/MA/PR/15.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/tai50b/MA/PR/15.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/tai50b.dat gga t 25.0 -ps 60 -c PR -lsga Best -itpls 1 -ls 2optb -aux -seed 15 -csvf /tmp -csvs MA_PR_15; mv /tmp/objective_value_MA_PR_15.csv ./results/paper/tai50b/MA/PR/objective_value_15.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_MA_PR_15.csv ./results/paper/tai50b/MA/PR/diversity_15.csv; fi

wait $!
