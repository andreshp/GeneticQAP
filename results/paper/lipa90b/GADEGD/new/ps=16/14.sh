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
#$ -o ./results/paper/lipa90b/GADEGD/new/ps=16/14.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/lipa90b/GADEGD/new/ps=16/14.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/lipa90b.dat gadegd t 81.0 -ps 16 -c PR -aux -seed 14 -csvf /tmp -csvs GADEGD_new_ps=16_14; mv /tmp/objective_value_GADEGD_new_ps=16_14.csv ./results/paper/lipa90b/GADEGD/new/ps=16/objective_value_14.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GADEGD_new_ps=16_14.csv ./results/paper/lipa90b/GADEGD/new/ps=16/diversity_14.csv; fi

wait $!
