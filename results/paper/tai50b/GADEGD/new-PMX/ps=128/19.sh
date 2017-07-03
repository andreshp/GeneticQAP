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
#$ -o ./results/paper/tai50b/GADEGD/new-PMX/ps=128/19.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/tai50b/GADEGD/new-PMX/ps=128/19.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/tai50b.dat gadegd t 25.0 -ps 128 -c PMX -aux -seed 19 -csvf /tmp -csvs GADEGD_new-PMX_ps=128_19; mv /tmp/objective_value_GADEGD_new-PMX_ps=128_19.csv ./results/paper/tai50b/GADEGD/new-PMX/ps=128/objective_value_19.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GADEGD_new-PMX_ps=128_19.csv ./results/paper/tai50b/GADEGD/new-PMX/ps=128/diversity_19.csv; fi

wait $!
