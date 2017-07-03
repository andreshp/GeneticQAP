#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-tai60a

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/tai60a/GADEGD/new-random/ps=64/1.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/tai60a/GADEGD/new-random/ps=64/1.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/tai60a.dat gadegd t 36.0 -ps 64 -c PR -aux -seed 1 -csvf /tmp -csvs GADEGD_new-random_ps=64_1; mv /tmp/objective_value_GADEGD_new-random_ps=64_1.csv ./results/paper/tai60a/GADEGD/new-random/ps=64/objective_value_1.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GADEGD_new-random_ps=64_1.csv ./results/paper/tai60a/GADEGD/new-random/ps=64/diversity_1.csv; fi

wait $!
