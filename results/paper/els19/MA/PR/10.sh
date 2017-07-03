#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-els19

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/els19/MA/PR/10.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/els19/MA/PR/10.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/els19.dat gga t 3.61 -ps 60 -c PR -lsga Best -itpls 1 -ls 2optb -aux -seed 10 -csvf /tmp -csvs MA_PR_10; mv /tmp/objective_value_MA_PR_10.csv ./results/paper/els19/MA/PR/objective_value_10.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_MA_PR_10.csv ./results/paper/els19/MA/PR/diversity_10.csv; fi

wait $!
