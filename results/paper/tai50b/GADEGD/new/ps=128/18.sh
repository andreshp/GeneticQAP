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
#$ -o ./results/paper/tai50b/GADEGD/new/ps=128/18.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/tai50b/GADEGD/new/ps=128/18.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/tai50b.dat gadegd t 25.0 -ps 128 -c PR -aux -seed 18 -csvf /tmp -csvs GADEGD_new_ps=128_18; mv /tmp/objective_value_GADEGD_new_ps=128_18.csv ./results/paper/tai50b/GADEGD/new/ps=128/objective_value_18.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GADEGD_new_ps=128_18.csv ./results/paper/tai50b/GADEGD/new/ps=128/diversity_18.csv; fi

wait $!
