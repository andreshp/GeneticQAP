#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-tai30b

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/tai30b/MA/Position/20.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/tai30b/MA/Position/20.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/tai30b.dat gga t 9.0 -ps 60 -c Position -lsga Best -itpls 1 -ls 2optb -aux -seed 20 -csvf /tmp -csvs MA_Position_20; mv /tmp/objective_value_MA_Position_20.csv ./results/paper/tai30b/MA/Position/objective_value_20.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_MA_Position_20.csv ./results/paper/tai30b/MA/Position/diversity_20.csv; fi

wait $!
