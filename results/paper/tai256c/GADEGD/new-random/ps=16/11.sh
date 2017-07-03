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
#$ -o ./results/paper/tai256c/GADEGD/new-random/ps=16/11.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/tai256c/GADEGD/new-random/ps=16/11.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/tai256c.dat gadegd t 655.36 -ps 16 -c PR -aux -seed 11 -csvf /tmp -csvs GADEGD_new-random_ps=16_11; mv /tmp/objective_value_GADEGD_new-random_ps=16_11.csv ./results/paper/tai256c/GADEGD/new-random/ps=16/objective_value_11.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GADEGD_new-random_ps=16_11.csv ./results/paper/tai256c/GADEGD/new-random/ps=16/diversity_11.csv; fi

wait $!
