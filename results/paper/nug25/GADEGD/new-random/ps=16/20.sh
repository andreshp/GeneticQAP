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
#$ -o ./results/paper/nug25/GADEGD/new-random/ps=16/20.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/nug25/GADEGD/new-random/ps=16/20.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/nug25.dat gadegd t 6.25 -ps 16 -c PR -aux -seed 20 -csvf /tmp -csvs GADEGD_new-random_ps=16_20; mv /tmp/objective_value_GADEGD_new-random_ps=16_20.csv ./results/paper/nug25/GADEGD/new-random/ps=16/objective_value_20.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GADEGD_new-random_ps=16_20.csv ./results/paper/nug25/GADEGD/new-random/ps=16/diversity_20.csv; fi

wait $!
