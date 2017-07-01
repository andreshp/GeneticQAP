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
#$ -o ./results/paper/kra30b/GADEGD/new/ps=16/17.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/kra30b/GADEGD/new/ps=16/17.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/kra30b.dat gadegd t 9.0 -ps 16 -c PR -aux -seed 17 -csvf /tmp -csvs GADEGD_new_ps=16_17; mv /tmp/objective_value_GADEGD_new_ps=16_17.csv ./results/paper/kra30b/GADEGD/new/ps=16/objective_value_17.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GADEGD_new_ps=16_17.csv ./results/paper/kra30b/GADEGD/new/ps=16/diversity_17.csv; fi

wait $!
