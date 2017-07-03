#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-tai50b

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/tai50b/GADEGD/new-random/ps=16/27.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/tai50b/GADEGD/new-random/ps=16/27.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/tai50b.dat gadegd t 25.0 -ps 16 -c PR -aux -seed 27 -csvf /tmp -csvs GADEGD_new-random_ps=16_27; mv /tmp/objective_value_GADEGD_new-random_ps=16_27.csv ./results/paper/tai50b/GADEGD/new-random/ps=16/objective_value_27.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GADEGD_new-random_ps=16_27.csv ./results/paper/tai50b/GADEGD/new-random/ps=16/diversity_27.csv; fi

wait $!
