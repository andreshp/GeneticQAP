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
#$ -o ./results/paper/tai256c/GADEGD/original/ps=32/2.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/tai256c/GADEGD/original/ps=32/2.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/tai256c.dat gadegd t 0 -ps 32 -c PR -aux -seed 2 -csvf /tmp -csvs GADEGD_original_ps=32_2; mv /tmp/objective_value_GADEGD_original_ps=32_2.csv ./results/paper/tai256c/GADEGD/original/ps=32/objective_value_2.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GADEGD_original_ps=32_2.csv ./results/paper/tai256c/GADEGD/original/ps=32/diversity_2.csv; fi

wait $!
