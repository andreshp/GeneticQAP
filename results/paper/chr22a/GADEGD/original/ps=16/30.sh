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
#$ -o ./results/paper/chr22a/GADEGD/original/ps=16/30.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/chr22a/GADEGD/original/ps=16/30.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/chr22a.dat gadegd t 0 -ps 16 -c PR -aux -seed 30 -csvf /tmp -csvs GADEGD_original_ps=16_30; mv /tmp/objective_value_GADEGD_original_ps=16_30.csv ./results/paper/chr22a/GADEGD/original/ps=16/objective_value_30.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GADEGD_original_ps=16_30.csv ./results/paper/chr22a/GADEGD/original/ps=16/diversity_30.csv; fi

wait $!
