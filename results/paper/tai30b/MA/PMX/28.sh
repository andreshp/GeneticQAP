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
#$ -o ./results/paper/tai30b/MA/PMX/28.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/tai30b/MA/PMX/28.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/tai30b.dat gga t 9.0 -ps 60 -c PMX -lsga Best -itpls 1 -ls 2optb -aux -seed 28 -csvf /tmp -csvs MA_PMX_28; mv /tmp/objective_value_MA_PMX_28.csv ./results/paper/tai30b/MA/PMX/objective_value_28.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_MA_PMX_28.csv ./results/paper/tai30b/MA/PMX/diversity_28.csv; fi

wait $!
