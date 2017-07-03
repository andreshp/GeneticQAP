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
#$ -o ./results/paper/tai30b/GADEGD/new-PMX/ps=32/10.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/tai30b/GADEGD/new-PMX/ps=32/10.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/tai30b.dat gadegd t 9.0 -ps 32 -c PMX -aux -seed 10 -csvf /tmp -csvs GADEGD_new-PMX_ps=32_10; mv /tmp/objective_value_GADEGD_new-PMX_ps=32_10.csv ./results/paper/tai30b/GADEGD/new-PMX/ps=32/objective_value_10.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GADEGD_new-PMX_ps=32_10.csv ./results/paper/tai30b/GADEGD/new-PMX/ps=32/diversity_10.csv; fi

wait $!
