#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-nug25

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/nug25/GADEGD/new-random/ps=16/16.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/nug25/GADEGD/new-random/ps=16/16.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/nug25.dat gadegd t 6.25 -ps 16 -c PR -aux -seed 16 -csvf /tmp -csvs GADEGD_new-random_ps=16_16; mv /tmp/objective_value_GADEGD_new-random_ps=16_16.csv ./results/paper/nug25/GADEGD/new-random/ps=16/objective_value_16.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GADEGD_new-random_ps=16_16.csv ./results/paper/nug25/GADEGD/new-random/ps=16/diversity_16.csv; fi

wait $!
