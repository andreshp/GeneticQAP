#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-kra30b

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/kra30b/MA/PR/17.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/kra30b/MA/PR/17.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/kra30b.dat gga t 9.0 -ps 60 -c PR -lsga Best -itpls 1 -ls 2optb -aux -seed 17 -csvf /tmp -csvs MA_PR_17; mv /tmp/objective_value_MA_PR_17.csv ./results/paper/kra30b/MA/PR/objective_value_17.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_MA_PR_17.csv ./results/paper/kra30b/MA/PR/diversity_17.csv; fi

wait $!
