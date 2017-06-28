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
#$ -o ./results/paper/chr20b/GADEGD/original/ps=32/6.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/chr20b/GADEGD/original/ps=32/6.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/chr20b.dat gadegd t 0 -ps 32 -c PR -aux -seed 6 -csvf /tmp -csvs GADEGD_original_ps=32_6; mv /tmp/objective_value_GADEGD_original_ps=32_6.csv ./results/paper/chr20b/GADEGD/original/ps=32/objective_value_6.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GADEGD_original_ps=32_6.csv ./results/paper/chr20b/GADEGD/original/ps=32/diversity_6.csv; fi

wait $!
