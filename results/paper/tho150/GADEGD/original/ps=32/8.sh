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
#$ -o ./results/paper/tho150/GADEGD/original/ps=32/8.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/tho150/GADEGD/original/ps=32/8.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/tho150.dat gadegd t 225.0 -ps 32 -c PR -aux -seed 8 -csvf /tmp -csvs GADEGD_original_ps=32_8; mv /tmp/objective_value_GADEGD_original_ps=32_8.csv ./results/paper/tho150/GADEGD/original/ps=32/objective_value_8.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GADEGD_original_ps=32_8.csv ./results/paper/tho150/GADEGD/original/ps=32/diversity_8.csv; fi

wait $!
