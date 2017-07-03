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
#$ -o ./results/paper/tai50b/GADEGD/new-Position/ps=32/21.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/tai50b/GADEGD/new-Position/ps=32/21.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/tai50b.dat gadegd t 25.0 -ps 32 -c Position -aux -seed 21 -csvf /tmp -csvs GADEGD_new-Position_ps=32_21; mv /tmp/objective_value_GADEGD_new-Position_ps=32_21.csv ./results/paper/tai50b/GADEGD/new-Position/ps=32/objective_value_21.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GADEGD_new-Position_ps=32_21.csv ./results/paper/tai50b/GADEGD/new-Position/ps=32/diversity_21.csv; fi

wait $!
