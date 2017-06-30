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
#$ -o ./results/paper/nug25/GADEGD/original/ps=32/14.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/nug25/GADEGD/original/ps=32/14.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/nug25.dat gadegd t 6.25 -ps 32 -c PR -aux -seed 14 -csvf /tmp -csvs GADEGD_original_ps=32_14; mv /tmp/objective_value_GADEGD_original_ps=32_14.csv ./results/paper/nug25/GADEGD/original/ps=32/objective_value_14.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GADEGD_original_ps=32_14.csv ./results/paper/nug25/GADEGD/original/ps=32/diversity_14.csv; fi

wait $!
