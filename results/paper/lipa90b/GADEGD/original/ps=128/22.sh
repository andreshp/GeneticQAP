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
#$ -o ./results/paper/lipa90b/GADEGD/original/ps=128/22.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/lipa90b/GADEGD/original/ps=128/22.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/lipa90b.dat gadegd t 81.0 -ps 128 -c PR -aux -seed 22 -csvf /tmp -csvs GADEGD_original_ps=128_22; mv /tmp/objective_value_GADEGD_original_ps=128_22.csv ./results/paper/lipa90b/GADEGD/original/ps=128/objective_value_22.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GADEGD_original_ps=128_22.csv ./results/paper/lipa90b/GADEGD/original/ps=128/diversity_22.csv; fi

wait $!
