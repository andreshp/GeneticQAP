#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-chr22a

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/chr22a/GADEGD/original/ps=32/18.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/chr22a/GADEGD/original/ps=32/18.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/chr22a.dat gadegd t 4.84 -ps 32 -c PR -aux -seed 18 -csvf /tmp -csvs GADEGD_original_ps=32_18; mv /tmp/objective_value_GADEGD_original_ps=32_18.csv ./results/paper/chr22a/GADEGD/original/ps=32/objective_value_18.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GADEGD_original_ps=32_18.csv ./results/paper/chr22a/GADEGD/original/ps=32/diversity_18.csv; fi

wait $!
