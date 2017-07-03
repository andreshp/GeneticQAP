#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-tai60a

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/tai60a/GADEGD/new-Position/ps=32/1.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/tai60a/GADEGD/new-Position/ps=32/1.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/tai60a.dat gadegd t 36.0 -ps 32 -c Position -aux -seed 1 -csvf /tmp -csvs GADEGD_new-Position_ps=32_1; mv /tmp/objective_value_GADEGD_new-Position_ps=32_1.csv ./results/paper/tai60a/GADEGD/new-Position/ps=32/objective_value_1.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GADEGD_new-Position_ps=32_1.csv ./results/paper/tai60a/GADEGD/new-Position/ps=32/diversity_1.csv; fi

wait $!
