#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-lipa90b

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/lipa90b/GADEGD/new-PMX/ps=64/9.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/lipa90b/GADEGD/new-PMX/ps=64/9.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/lipa90b.dat gadegd t 81.0 -ps 64 -c PMX -aux -seed 9 -csvf /tmp -csvs GADEGD_new-PMX_ps=64_9; mv /tmp/objective_value_GADEGD_new-PMX_ps=64_9.csv ./results/paper/lipa90b/GADEGD/new-PMX/ps=64/objective_value_9.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GADEGD_new-PMX_ps=64_9.csv ./results/paper/lipa90b/GADEGD/new-PMX/ps=64/diversity_9.csv; fi

wait $!
