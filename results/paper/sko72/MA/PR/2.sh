#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-sko72

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/sko72/MA/PR/2.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/sko72/MA/PR/2.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/sko72.dat gga t 51.84 -ps 60 -c PR -lsga Best -itpls 1 -ls 2optb -aux -seed 2 -csvf /tmp -csvs MA_PR_2; mv /tmp/objective_value_MA_PR_2.csv ./results/paper/sko72/MA/PR/objective_value_2.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_MA_PR_2.csv ./results/paper/sko72/MA/PR/diversity_2.csv; fi

wait $!
