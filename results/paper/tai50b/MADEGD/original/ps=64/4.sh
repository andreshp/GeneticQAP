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
#$ -o ./results/paper/tai50b/MADEGD/original/ps=64/4.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/tai50b/MADEGD/original/ps=64/4.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/tai50b.dat gadegd t 25 -ps 64 -c PR -aux -lsga Best -ls 2optb -itpls 1 -seed 4 -csvf /tmp -csvs MADEGD_original_ps=64_4; mv /tmp/objective_value_MADEGD_original_ps=64_4.csv ./results/paper/tai50b/MADEGD/original/ps=64/objective_value_4.csv

wait $!
