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
#$ -o ./results/paper/chr20b/GADEGD/original/ps=16/8.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/chr20b/GADEGD/original/ps=16/8.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/chr20b.dat gadegd t 4.0 -ps 16 -c PR -aux -seed 8 -csvf /tmp -csvs GADEGD_original_ps=16_8; mv /tmp/objective_value_GADEGD_original_ps=16_8.csv ./results/paper/chr20b/GADEGD/original/ps=16/objective_value_8.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GADEGD_original_ps=16_8.csv ./results/paper/chr20b/GADEGD/original/ps=16/diversity_8.csv; fi

wait $!
