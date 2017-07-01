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
#$ -o ./results/paper/tai256c/GADEGD/new/ps=8/4.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/tai256c/GADEGD/new/ps=8/4.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/tai256c.dat gadegd t 655.36 -ps 8 -c PR -aux -seed 4 -csvf /tmp -csvs GADEGD_new_ps=8_4; mv /tmp/objective_value_GADEGD_new_ps=8_4.csv ./results/paper/tai256c/GADEGD/new/ps=8/objective_value_4.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GADEGD_new_ps=8_4.csv ./results/paper/tai256c/GADEGD/new/ps=8/diversity_4.csv; fi

wait $!
