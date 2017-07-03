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
#$ -o ./results/paper/tai50b/GADEGD/new-PMX/ps=64/7.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/tai50b/GADEGD/new-PMX/ps=64/7.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/tai50b.dat gadegd t 25.0 -ps 64 -c PMX -aux -seed 7 -csvf /tmp -csvs GADEGD_new-PMX_ps=64_7; mv /tmp/objective_value_GADEGD_new-PMX_ps=64_7.csv ./results/paper/tai50b/GADEGD/new-PMX/ps=64/objective_value_7.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GADEGD_new-PMX_ps=64_7.csv ./results/paper/tai50b/GADEGD/new-PMX/ps=64/diversity_7.csv; fi

wait $!
