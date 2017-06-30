#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-lipa90b

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/lipa90b/GADEGD/original/ps=32/25.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/lipa90b/GADEGD/original/ps=32/25.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/lipa90b.dat gadegd t 81.0 -ps 32 -c PR -aux -seed 25 -csvf /tmp -csvs GADEGD_original_ps=32_25; mv /tmp/objective_value_GADEGD_original_ps=32_25.csv ./results/paper/lipa90b/GADEGD/original/ps=32/objective_value_25.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GADEGD_original_ps=32_25.csv ./results/paper/lipa90b/GADEGD/original/ps=32/diversity_25.csv; fi

wait $!
