#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-tai256c

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/tai256c/MADEGD/original/ps=64/11.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/tai256c/MADEGD/original/ps=64/11.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/tai256c.dat gadegd t 0 -ps 64 -c PR -aux -lsga Best -ls 2optb -itpls 1 -seed 11 -csvf /tmp -csvs MADEGD_original_ps=64_11; mv /tmp/objective_value_MADEGD_original_ps=64_11.csv ./results/paper/tai256c/MADEGD/original/ps=64/objective_value_11.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_MADEGD_original_ps=64_11.csv ./results/paper/tai256c/MADEGD/original/ps=64/diversity_11.csv; fi

wait $!
