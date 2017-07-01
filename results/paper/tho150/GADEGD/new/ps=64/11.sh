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
#$ -o ./results/paper/tho150/GADEGD/new/ps=64/11.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/tho150/GADEGD/new/ps=64/11.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/tho150.dat gadegd t 225.0 -ps 64 -c PR -aux -seed 11 -csvf /tmp -csvs GADEGD_new_ps=64_11; mv /tmp/objective_value_GADEGD_new_ps=64_11.csv ./results/paper/tho150/GADEGD/new/ps=64/objective_value_11.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GADEGD_new_ps=64_11.csv ./results/paper/tho150/GADEGD/new/ps=64/diversity_11.csv; fi

wait $!
