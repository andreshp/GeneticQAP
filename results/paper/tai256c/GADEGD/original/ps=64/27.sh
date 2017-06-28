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
#$ -o ./results/paper/tai256c/GADEGD/original/ps=64/27.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/tai256c/GADEGD/original/ps=64/27.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/tai256c.dat gadegd t 0 -ps 64 -c PR -aux -seed 27 -csvf /tmp -csvs GADEGD_original_ps=64_27; mv /tmp/objective_value_GADEGD_original_ps=64_27.csv ./results/paper/tai256c/GADEGD/original/ps=64/objective_value_27.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GADEGD_original_ps=64_27.csv ./results/paper/tai256c/GADEGD/original/ps=64/diversity_27.csv; fi

wait $!
