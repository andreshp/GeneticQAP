#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-tai50b

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/tai50b/GADEGD/original/ps=16/19.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/tai50b/GADEGD/original/ps=16/19.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/tai50b.dat gadegd t 25.0 -ps 16 -c PR -aux -seed 19 -csvf /tmp -csvs GADEGD_original_ps=16_19; mv /tmp/objective_value_GADEGD_original_ps=16_19.csv ./results/paper/tai50b/GADEGD/original/ps=16/objective_value_19.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GADEGD_original_ps=16_19.csv ./results/paper/tai50b/GADEGD/original/ps=16/diversity_19.csv; fi

wait $!
