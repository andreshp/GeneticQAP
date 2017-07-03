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
#$ -o ./results/paper/tai50b/GADEGD/new-PMX/ps=32/9.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/tai50b/GADEGD/new-PMX/ps=32/9.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/tai50b.dat gadegd t 25.0 -ps 32 -c PMX -aux -seed 9 -csvf /tmp -csvs GADEGD_new-PMX_ps=32_9; mv /tmp/objective_value_GADEGD_new-PMX_ps=32_9.csv ./results/paper/tai50b/GADEGD/new-PMX/ps=32/objective_value_9.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GADEGD_new-PMX_ps=32_9.csv ./results/paper/tai50b/GADEGD/new-PMX/ps=32/diversity_9.csv; fi

wait $!
