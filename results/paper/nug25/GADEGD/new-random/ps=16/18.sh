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
#$ -o ./results/paper/nug25/GADEGD/new-random/ps=16/18.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/nug25/GADEGD/new-random/ps=16/18.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/nug25.dat gadegd t 6.25 -ps 16 -c PR -aux -seed 18 -csvf /tmp -csvs GADEGD_new-random_ps=16_18; mv /tmp/objective_value_GADEGD_new-random_ps=16_18.csv ./results/paper/nug25/GADEGD/new-random/ps=16/objective_value_18.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GADEGD_new-random_ps=16_18.csv ./results/paper/nug25/GADEGD/new-random/ps=16/diversity_18.csv; fi

wait $!
