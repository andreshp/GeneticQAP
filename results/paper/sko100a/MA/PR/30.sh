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
#$ -o ./results/paper/sko100a/MA/PR/30.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/sko100a/MA/PR/30.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/sko100a.dat gga t 100.0 -ps 60 -c PR -lsga Best -itpls 1 -ls 2optb -aux -seed 30 -csvf /tmp -csvs MA_PR_30; mv /tmp/objective_value_MA_PR_30.csv ./results/paper/sko100a/MA/PR/objective_value_30.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_MA_PR_30.csv ./results/paper/sko100a/MA/PR/diversity_30.csv; fi

wait $!
