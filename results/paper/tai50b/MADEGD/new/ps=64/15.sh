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
#$ -o ./results/paper/tai50b/MADEGD/new/ps=64/15.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/tai50b/MADEGD/new/ps=64/15.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/tai50b.dat gadegd t 25.0 -ps 64 -c PR -aux -lsga Best -ls 2optb -seed 15 -csvf /tmp -csvs MADEGD_new_ps=64_15; mv /tmp/objective_value_MADEGD_new_ps=64_15.csv ./results/paper/tai50b/MADEGD/new/ps=64/objective_value_15.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_MADEGD_new_ps=64_15.csv ./results/paper/tai50b/MADEGD/new/ps=64/diversity_15.csv; fi

wait $!
