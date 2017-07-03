#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-sko64

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/sko64/MA/PR/12.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/sko64/MA/PR/12.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/sko64.dat gga t 40.96 -ps 60 -c PR -lsga Best -itpls 1 -ls 2optb -aux -seed 12 -csvf /tmp -csvs MA_PR_12; mv /tmp/objective_value_MA_PR_12.csv ./results/paper/sko64/MA/PR/objective_value_12.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_MA_PR_12.csv ./results/paper/sko64/MA/PR/diversity_12.csv; fi

wait $!
