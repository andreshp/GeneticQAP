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
#$ -o ./results/paper/chr22a/GADEGD/new-random/ps=16/3.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/chr22a/GADEGD/new-random/ps=16/3.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/chr22a.dat gadegd t 4.84 -ps 16 -c PR -aux -seed 3 -csvf /tmp -csvs GADEGD_new-random_ps=16_3; mv /tmp/objective_value_GADEGD_new-random_ps=16_3.csv ./results/paper/chr22a/GADEGD/new-random/ps=16/objective_value_3.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GADEGD_new-random_ps=16_3.csv ./results/paper/chr22a/GADEGD/new-random/ps=16/diversity_3.csv; fi

wait $!
