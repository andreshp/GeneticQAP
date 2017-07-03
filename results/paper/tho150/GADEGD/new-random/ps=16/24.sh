#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-tho150

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/tho150/GADEGD/new-random/ps=16/24.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/tho150/GADEGD/new-random/ps=16/24.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/tho150.dat gadegd t 225.0 -ps 16 -c PR -aux -seed 24 -csvf /tmp -csvs GADEGD_new-random_ps=16_24; mv /tmp/objective_value_GADEGD_new-random_ps=16_24.csv ./results/paper/tho150/GADEGD/new-random/ps=16/objective_value_24.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GADEGD_new-random_ps=16_24.csv ./results/paper/tho150/GADEGD/new-random/ps=16/diversity_24.csv; fi

wait $!
