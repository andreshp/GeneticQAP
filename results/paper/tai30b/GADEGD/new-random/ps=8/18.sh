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
#$ -o ./results/paper/tai30b/GADEGD/new-random/ps=8/18.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/tai30b/GADEGD/new-random/ps=8/18.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/tai30b.dat gadegd t 9.0 -ps 8 -c PR -aux -seed 18 -csvf /tmp -csvs GADEGD_new-random_ps=8_18; mv /tmp/objective_value_GADEGD_new-random_ps=8_18.csv ./results/paper/tai30b/GADEGD/new-random/ps=8/objective_value_18.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GADEGD_new-random_ps=8_18.csv ./results/paper/tai30b/GADEGD/new-random/ps=8/diversity_18.csv; fi

wait $!
