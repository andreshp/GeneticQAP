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
#$ -o ./results/paper/tai256c/GADEGD/new-random/ps=8/13.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/tai256c/GADEGD/new-random/ps=8/13.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/tai256c.dat gadegd t 655.36 -ps 8 -c PR -aux -seed 13 -csvf /tmp -csvs GADEGD_new-random_ps=8_13; mv /tmp/objective_value_GADEGD_new-random_ps=8_13.csv ./results/paper/tai256c/GADEGD/new-random/ps=8/objective_value_13.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GADEGD_new-random_ps=8_13.csv ./results/paper/tai256c/GADEGD/new-random/ps=8/diversity_13.csv; fi

wait $!
