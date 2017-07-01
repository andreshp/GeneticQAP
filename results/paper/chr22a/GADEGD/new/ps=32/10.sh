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
#$ -o ./results/paper/chr22a/GADEGD/new/ps=32/10.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/chr22a/GADEGD/new/ps=32/10.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/chr22a.dat gadegd t 4.84 -ps 32 -c PR -aux -seed 10 -csvf /tmp -csvs GADEGD_new_ps=32_10; mv /tmp/objective_value_GADEGD_new_ps=32_10.csv ./results/paper/chr22a/GADEGD/new/ps=32/objective_value_10.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GADEGD_new_ps=32_10.csv ./results/paper/chr22a/GADEGD/new/ps=32/diversity_10.csv; fi

wait $!
