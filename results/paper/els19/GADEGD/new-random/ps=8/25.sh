#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-els19

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/els19/GADEGD/new-random/ps=8/25.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/els19/GADEGD/new-random/ps=8/25.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/els19.dat gadegd t 3.61 -ps 8 -c PR -aux -seed 25 -csvf /tmp -csvs GADEGD_new-random_ps=8_25; mv /tmp/objective_value_GADEGD_new-random_ps=8_25.csv ./results/paper/els19/GADEGD/new-random/ps=8/objective_value_25.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GADEGD_new-random_ps=8_25.csv ./results/paper/els19/GADEGD/new-random/ps=8/diversity_25.csv; fi

wait $!
