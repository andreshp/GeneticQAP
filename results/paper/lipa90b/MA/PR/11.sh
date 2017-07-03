#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-lipa90b

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/lipa90b/MA/PR/11.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/lipa90b/MA/PR/11.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/lipa90b.dat gga t 81.0 -ps 60 -c PR -lsga Best -itpls 1 -ls 2optb -aux -seed 11 -csvf /tmp -csvs MA_PR_11; mv /tmp/objective_value_MA_PR_11.csv ./results/paper/lipa90b/MA/PR/objective_value_11.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_MA_PR_11.csv ./results/paper/lipa90b/MA/PR/diversity_11.csv; fi

wait $!
