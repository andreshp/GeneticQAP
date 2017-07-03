#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-kra30b

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/kra30b/GADEGD/new-random/ps=8/19.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/kra30b/GADEGD/new-random/ps=8/19.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/kra30b.dat gadegd t 9.0 -ps 8 -c PR -aux -seed 19 -csvf /tmp -csvs GADEGD_new-random_ps=8_19; mv /tmp/objective_value_GADEGD_new-random_ps=8_19.csv ./results/paper/kra30b/GADEGD/new-random/ps=8/objective_value_19.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GADEGD_new-random_ps=8_19.csv ./results/paper/kra30b/GADEGD/new-random/ps=8/diversity_19.csv; fi

wait $!
