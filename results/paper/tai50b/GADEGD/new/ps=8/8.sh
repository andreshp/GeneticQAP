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
#$ -o ./results/paper/tai50b/GADEGD/new/ps=8/8.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/tai50b/GADEGD/new/ps=8/8.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/tai50b.dat gadegd t 25.0 -ps 8 -c PR -aux -seed 8 -csvf /tmp -csvs GADEGD_new_ps=8_8; mv /tmp/objective_value_GADEGD_new_ps=8_8.csv ./results/paper/tai50b/GADEGD/new/ps=8/objective_value_8.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GADEGD_new_ps=8_8.csv ./results/paper/tai50b/GADEGD/new/ps=8/diversity_8.csv; fi

wait $!
