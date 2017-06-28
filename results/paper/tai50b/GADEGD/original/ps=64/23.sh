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
#$ -o ./results/paper/tai50b/GADEGD/original/ps=64/23.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/tai50b/GADEGD/original/ps=64/23.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/tai50b.dat gadegd t 0 -ps 64 -c PR -aux -seed 23 -csvf /tmp -csvs GADEGD_original_ps=64_23; mv /tmp/objective_value_GADEGD_original_ps=64_23.csv ./results/paper/tai50b/GADEGD/original/ps=64/objective_value_23.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GADEGD_original_ps=64_23.csv ./results/paper/tai50b/GADEGD/original/ps=64/diversity_23.csv; fi

wait $!
