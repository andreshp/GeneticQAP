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
#$ -o ./results/paper/tai256c/GADEGD/new-random/ps=64/22.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/tai256c/GADEGD/new-random/ps=64/22.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/tai256c.dat gadegd t 655.36 -ps 64 -c PR -aux -seed 22 -csvf /tmp -csvs GADEGD_new-random_ps=64_22; mv /tmp/objective_value_GADEGD_new-random_ps=64_22.csv ./results/paper/tai256c/GADEGD/new-random/ps=64/objective_value_22.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GADEGD_new-random_ps=64_22.csv ./results/paper/tai256c/GADEGD/new-random/ps=64/diversity_22.csv; fi

wait $!
