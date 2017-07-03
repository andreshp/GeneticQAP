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
#$ -o ./results/paper/tho150/GADEGD/new-random/ps=8/28.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/tho150/GADEGD/new-random/ps=8/28.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/tho150.dat gadegd t 225.0 -ps 8 -c PR -aux -seed 28 -csvf /tmp -csvs GADEGD_new-random_ps=8_28; mv /tmp/objective_value_GADEGD_new-random_ps=8_28.csv ./results/paper/tho150/GADEGD/new-random/ps=8/objective_value_28.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GADEGD_new-random_ps=8_28.csv ./results/paper/tho150/GADEGD/new-random/ps=8/diversity_28.csv; fi

wait $!
