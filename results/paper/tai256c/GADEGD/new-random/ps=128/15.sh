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
#$ -o ./results/paper/tai256c/GADEGD/new-random/ps=128/15.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/tai256c/GADEGD/new-random/ps=128/15.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/tai256c.dat gadegd t 655.36 -ps 128 -c PR -aux -seed 15 -csvf /tmp -csvs GADEGD_new-random_ps=128_15; mv /tmp/objective_value_GADEGD_new-random_ps=128_15.csv ./results/paper/tai256c/GADEGD/new-random/ps=128/objective_value_15.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GADEGD_new-random_ps=128_15.csv ./results/paper/tai256c/GADEGD/new-random/ps=128/diversity_15.csv; fi

wait $!
