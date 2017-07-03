#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-els19

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/els19/GADEGD/new-PMX/ps=64/4.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/els19/GADEGD/new-PMX/ps=64/4.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/els19.dat gadegd t 3.61 -ps 64 -c PMX -aux -seed 4 -csvf /tmp -csvs GADEGD_new-PMX_ps=64_4; mv /tmp/objective_value_GADEGD_new-PMX_ps=64_4.csv ./results/paper/els19/GADEGD/new-PMX/ps=64/objective_value_4.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GADEGD_new-PMX_ps=64_4.csv ./results/paper/els19/GADEGD/new-PMX/ps=64/diversity_4.csv; fi

wait $!
