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
#$ -o ./results/paper/tai256c/GADEGD/new-Position/ps=32/12.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/tai256c/GADEGD/new-Position/ps=32/12.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/tai256c.dat gadegd t 655.36 -ps 32 -c Position -aux -seed 12 -csvf /tmp -csvs GADEGD_new-Position_ps=32_12; mv /tmp/objective_value_GADEGD_new-Position_ps=32_12.csv ./results/paper/tai256c/GADEGD/new-Position/ps=32/objective_value_12.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GADEGD_new-Position_ps=32_12.csv ./results/paper/tai256c/GADEGD/new-Position/ps=32/diversity_12.csv; fi

wait $!
