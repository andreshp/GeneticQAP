#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-els19

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/els19/GADEGD/original/ps=128/28.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/els19/GADEGD/original/ps=128/28.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/els19.dat gadegd t 0 -ps 128 -c PR -aux -seed 28 -csvf /tmp -csvs GADEGD_original_ps=128_28; mv /tmp/objective_value_GADEGD_original_ps=128_28.csv ./results/paper/els19/GADEGD/original/ps=128/objective_value_28.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GADEGD_original_ps=128_28.csv ./results/paper/els19/GADEGD/original/ps=128/diversity_28.csv; fi

wait $!
