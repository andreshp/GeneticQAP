#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-chr22a

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/chr22a/GADEGD/new-random/ps=8/8.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/chr22a/GADEGD/new-random/ps=8/8.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/chr22a.dat gadegd t 4.84 -ps 8 -c PR -aux -seed 8 -csvf /tmp -csvs GADEGD_new-random_ps=8_8; mv /tmp/objective_value_GADEGD_new-random_ps=8_8.csv ./results/paper/chr22a/GADEGD/new-random/ps=8/objective_value_8.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GADEGD_new-random_ps=8_8.csv ./results/paper/chr22a/GADEGD/new-random/ps=8/diversity_8.csv; fi

wait $!
