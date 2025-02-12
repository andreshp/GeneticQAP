#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-tai30b

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/tai30b/GADEGD/new-random/ps=128/11.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/tai30b/GADEGD/new-random/ps=128/11.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/tai30b.dat gadegd t 9.0 -ps 128 -c PR -aux -seed 11 -csvf /tmp -csvs GADEGD_new-random_ps=128_11; mv /tmp/objective_value_GADEGD_new-random_ps=128_11.csv ./results/paper/tai30b/GADEGD/new-random/ps=128/objective_value_11.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GADEGD_new-random_ps=128_11.csv ./results/paper/tai30b/GADEGD/new-random/ps=128/diversity_11.csv; fi

wait $!
