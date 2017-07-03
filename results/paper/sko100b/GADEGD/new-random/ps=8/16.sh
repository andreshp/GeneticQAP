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
#$ -o ./results/paper/sko100b/GADEGD/new-random/ps=8/16.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/sko100b/GADEGD/new-random/ps=8/16.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/sko100b.dat gadegd t 100.0 -ps 8 -c PR -aux -seed 16 -csvf /tmp -csvs GADEGD_new-random_ps=8_16; mv /tmp/objective_value_GADEGD_new-random_ps=8_16.csv ./results/paper/sko100b/GADEGD/new-random/ps=8/objective_value_16.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GADEGD_new-random_ps=8_16.csv ./results/paper/sko100b/GADEGD/new-random/ps=8/diversity_16.csv; fi

wait $!
