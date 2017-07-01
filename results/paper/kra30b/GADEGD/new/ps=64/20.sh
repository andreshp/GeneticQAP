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
#$ -o ./results/paper/kra30b/GADEGD/new/ps=64/20.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/kra30b/GADEGD/new/ps=64/20.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/kra30b.dat gadegd t 9.0 -ps 64 -c PR -aux -seed 20 -csvf /tmp -csvs GADEGD_new_ps=64_20; mv /tmp/objective_value_GADEGD_new_ps=64_20.csv ./results/paper/kra30b/GADEGD/new/ps=64/objective_value_20.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GADEGD_new_ps=64_20.csv ./results/paper/kra30b/GADEGD/new/ps=64/diversity_20.csv; fi

wait $!
