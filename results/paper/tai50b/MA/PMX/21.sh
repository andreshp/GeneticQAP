#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-tai50b

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/tai50b/MA/PMX/21.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/tai50b/MA/PMX/21.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/tai50b.dat gga t 25.0 -ps 60 -c PMX -lsga Best -itpls 1 -ls 2optb -aux -seed 21 -csvf /tmp -csvs MA_PMX_21; mv /tmp/objective_value_MA_PMX_21.csv ./results/paper/tai50b/MA/PMX/objective_value_21.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_MA_PMX_21.csv ./results/paper/tai50b/MA/PMX/diversity_21.csv; fi

wait $!
