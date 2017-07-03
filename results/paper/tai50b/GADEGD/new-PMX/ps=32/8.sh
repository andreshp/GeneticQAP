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
#$ -o ./results/paper/tai50b/GADEGD/new-PMX/ps=32/8.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/tai50b/GADEGD/new-PMX/ps=32/8.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/tai50b.dat gadegd t 25.0 -ps 32 -c PMX -aux -seed 8 -csvf /tmp -csvs GADEGD_new-PMX_ps=32_8; mv /tmp/objective_value_GADEGD_new-PMX_ps=32_8.csv ./results/paper/tai50b/GADEGD/new-PMX/ps=32/objective_value_8.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GADEGD_new-PMX_ps=32_8.csv ./results/paper/tai50b/GADEGD/new-PMX/ps=32/diversity_8.csv; fi

wait $!
