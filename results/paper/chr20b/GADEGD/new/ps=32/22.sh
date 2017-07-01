#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-chr20b

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/chr20b/GADEGD/new/ps=32/22.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/chr20b/GADEGD/new/ps=32/22.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/chr20b.dat gadegd t 4.0 -ps 32 -c PR -aux -seed 22 -csvf /tmp -csvs GADEGD_new_ps=32_22; mv /tmp/objective_value_GADEGD_new_ps=32_22.csv ./results/paper/chr20b/GADEGD/new/ps=32/objective_value_22.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GADEGD_new_ps=32_22.csv ./results/paper/chr20b/GADEGD/new/ps=32/diversity_22.csv; fi

wait $!
