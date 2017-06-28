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
#$ -o ./results/paper/lipa90b/GADEGD/original/ps=64/28.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/lipa90b/GADEGD/original/ps=64/28.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/lipa90b.dat gadegd t 0 -ps 64 -c PR -aux -seed 28 -csvf /tmp -csvs GADEGD_original_ps=64_28; mv /tmp/objective_value_GADEGD_original_ps=64_28.csv ./results/paper/lipa90b/GADEGD/original/ps=64/objective_value_28.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GADEGD_original_ps=64_28.csv ./results/paper/lipa90b/GADEGD/original/ps=64/diversity_28.csv; fi

wait $!
