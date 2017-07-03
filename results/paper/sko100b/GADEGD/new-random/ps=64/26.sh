#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-sko100b

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/sko100b/GADEGD/new-random/ps=64/26.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/sko100b/GADEGD/new-random/ps=64/26.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/sko100b.dat gadegd t 100.0 -ps 64 -c PR -aux -seed 26 -csvf /tmp -csvs GADEGD_new-random_ps=64_26; mv /tmp/objective_value_GADEGD_new-random_ps=64_26.csv ./results/paper/sko100b/GADEGD/new-random/ps=64/objective_value_26.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GADEGD_new-random_ps=64_26.csv ./results/paper/sko100b/GADEGD/new-random/ps=64/diversity_26.csv; fi

wait $!
