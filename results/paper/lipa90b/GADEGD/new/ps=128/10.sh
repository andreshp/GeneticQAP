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
#$ -o ./results/paper/lipa90b/GADEGD/new/ps=128/10.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/lipa90b/GADEGD/new/ps=128/10.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/lipa90b.dat gadegd t 81.0 -ps 128 -c PR -aux -seed 10 -csvf /tmp -csvs GADEGD_new_ps=128_10; mv /tmp/objective_value_GADEGD_new_ps=128_10.csv ./results/paper/lipa90b/GADEGD/new/ps=128/objective_value_10.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GADEGD_new_ps=128_10.csv ./results/paper/lipa90b/GADEGD/new/ps=128/diversity_10.csv; fi

wait $!
