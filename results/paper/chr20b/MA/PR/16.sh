#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-chr20b

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/chr20b/MA/PR/16.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/chr20b/MA/PR/16.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/chr20b.dat gga t 4.0 -ps 60 -c PR -lsga Best -itpls 1 -ls 2optb -aux -seed 16 -csvf /tmp -csvs MA_PR_16; mv /tmp/objective_value_MA_PR_16.csv ./results/paper/chr20b/MA/PR/objective_value_16.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_MA_PR_16.csv ./results/paper/chr20b/MA/PR/diversity_16.csv; fi

wait $!
