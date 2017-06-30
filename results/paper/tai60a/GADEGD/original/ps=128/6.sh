#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-tai60a

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/tai60a/GADEGD/original/ps=128/6.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/tai60a/GADEGD/original/ps=128/6.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/tai60a.dat gadegd t 36.0 -ps 128 -c PR -aux -seed 6 -csvf /tmp -csvs GADEGD_original_ps=128_6; mv /tmp/objective_value_GADEGD_original_ps=128_6.csv ./results/paper/tai60a/GADEGD/original/ps=128/objective_value_6.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GADEGD_original_ps=128_6.csv ./results/paper/tai60a/GADEGD/original/ps=128/diversity_6.csv; fi

wait $!
