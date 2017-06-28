#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-tai30b

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/tai30b/GADEGD/original/ps=8/17.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/tai30b/GADEGD/original/ps=8/17.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/tai30b.dat gadegd t 0 -ps 8 -c PR -aux -seed 17 -csvf /tmp -csvs GADEGD_original_ps=8_17; mv /tmp/objective_value_GADEGD_original_ps=8_17.csv ./results/paper/tai30b/GADEGD/original/ps=8/objective_value_17.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GADEGD_original_ps=8_17.csv ./results/paper/tai30b/GADEGD/original/ps=8/diversity_17.csv; fi

wait $!
