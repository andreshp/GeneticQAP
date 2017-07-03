#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-sko100c

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/sko100c/GADEGD/new-random/ps=8/10.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/sko100c/GADEGD/new-random/ps=8/10.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/sko100c.dat gadegd t 100.0 -ps 8 -c PR -aux -seed 10 -csvf /tmp -csvs GADEGD_new-random_ps=8_10; mv /tmp/objective_value_GADEGD_new-random_ps=8_10.csv ./results/paper/sko100c/GADEGD/new-random/ps=8/objective_value_10.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GADEGD_new-random_ps=8_10.csv ./results/paper/sko100c/GADEGD/new-random/ps=8/diversity_10.csv; fi

wait $!
