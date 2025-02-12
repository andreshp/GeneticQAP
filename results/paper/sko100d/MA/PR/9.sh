#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-sko100d

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/sko100d/MA/PR/9.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/sko100d/MA/PR/9.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/sko100d.dat gga t 100.0 -ps 60 -c PR -lsga Best -itpls 1 -ls 2optb -aux -seed 9 -csvf /tmp -csvs MA_PR_9; mv /tmp/objective_value_MA_PR_9.csv ./results/paper/sko100d/MA/PR/objective_value_9.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_MA_PR_9.csv ./results/paper/sko100d/MA/PR/diversity_9.csv; fi

wait $!
