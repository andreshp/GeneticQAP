#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-esc32b

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/esc32b/MA/PR/16.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/esc32b/MA/PR/16.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/esc32b.dat gga t 10.24 -ps 60 -c PR -lsga Best -itpls 1 -ls 2optb -aux -seed 16 -csvf /tmp -csvs MA_PR_16; mv /tmp/objective_value_MA_PR_16.csv ./results/paper/esc32b/MA/PR/objective_value_16.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_MA_PR_16.csv ./results/paper/esc32b/MA/PR/diversity_16.csv; fi

wait $!
