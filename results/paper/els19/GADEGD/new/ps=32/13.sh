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
#$ -o ./results/paper/els19/GADEGD/new/ps=32/13.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/els19/GADEGD/new/ps=32/13.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/els19.dat gadegd t 3.61 -ps 32 -c PR -aux -seed 13 -csvf /tmp -csvs GADEGD_new_ps=32_13; mv /tmp/objective_value_GADEGD_new_ps=32_13.csv ./results/paper/els19/GADEGD/new/ps=32/objective_value_13.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GADEGD_new_ps=32_13.csv ./results/paper/els19/GADEGD/new/ps=32/diversity_13.csv; fi

wait $!
