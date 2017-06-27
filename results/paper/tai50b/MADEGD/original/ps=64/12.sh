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
#$ -o ./results/paper/tai50b/MADEGD/original/ps=64/12.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/tai50b/MADEGD/original/ps=64/12.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/tai50b.dat gadegd t 25 -ps 64 -c PR -aux -lsga Best -ls 2optb -itpls 1 -seed 12 -csvf /tmp -csvs MADEGD_original_ps=64_12; mv /tmp/objective_value_MADEGD_original_ps=64_12.csv ./results/paper/tai50b/MADEGD/original/ps=64/objective_value_12.csv

wait $!
