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
#$ -o ./results/paper/chr22a/GADEGD/new/ps=16/26.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/chr22a/GADEGD/new/ps=16/26.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/chr22a.dat gadegd t 4.84 -ps 16 -c PR -aux -seed 26 -csvf /tmp -csvs GADEGD_new_ps=16_26; mv /tmp/objective_value_GADEGD_new_ps=16_26.csv ./results/paper/chr22a/GADEGD/new/ps=16/objective_value_26.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GADEGD_new_ps=16_26.csv ./results/paper/chr22a/GADEGD/new/ps=16/diversity_26.csv; fi

wait $!
