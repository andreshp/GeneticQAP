#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-sko56

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/sko56/GADEGD/new-random/ps=16/22.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/sko56/GADEGD/new-random/ps=16/22.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/sko56.dat gadegd t 31.36 -ps 16 -c PR -aux -seed 22 -csvf /tmp -csvs GADEGD_new-random_ps=16_22; mv /tmp/objective_value_GADEGD_new-random_ps=16_22.csv ./results/paper/sko56/GADEGD/new-random/ps=16/objective_value_22.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GADEGD_new-random_ps=16_22.csv ./results/paper/sko56/GADEGD/new-random/ps=16/diversity_22.csv; fi

wait $!
