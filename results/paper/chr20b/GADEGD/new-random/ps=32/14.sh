#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-chr20b

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/chr20b/GADEGD/new-random/ps=32/14.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/chr20b/GADEGD/new-random/ps=32/14.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/chr20b.dat gadegd t 4.0 -ps 32 -c PR -aux -seed 14 -csvf /tmp -csvs GADEGD_new-random_ps=32_14; mv /tmp/objective_value_GADEGD_new-random_ps=32_14.csv ./results/paper/chr20b/GADEGD/new-random/ps=32/objective_value_14.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GADEGD_new-random_ps=32_14.csv ./results/paper/chr20b/GADEGD/new-random/ps=32/diversity_14.csv; fi

wait $!
