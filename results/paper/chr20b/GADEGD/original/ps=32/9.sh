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
#$ -o ./results/paper/chr20b/GADEGD/original/ps=32/9.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/chr20b/GADEGD/original/ps=32/9.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/chr20b.dat gadegd t 4.0 -ps 32 -c PR -aux -seed 9 -csvf /tmp -csvs GADEGD_original_ps=32_9; mv /tmp/objective_value_GADEGD_original_ps=32_9.csv ./results/paper/chr20b/GADEGD/original/ps=32/objective_value_9.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GADEGD_original_ps=32_9.csv ./results/paper/chr20b/GADEGD/original/ps=32/diversity_9.csv; fi

wait $!
