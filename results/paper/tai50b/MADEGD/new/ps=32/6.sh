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
#$ -o ./results/paper/tai50b/MADEGD/new/ps=32/6.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/tai50b/MADEGD/new/ps=32/6.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/tai50b.dat gadegd t 25.0 -ps 32 -c PR -aux -lsga Best -ls 2optb -seed 6 -csvf /tmp -csvs MADEGD_new_ps=32_6; mv /tmp/objective_value_MADEGD_new_ps=32_6.csv ./results/paper/tai50b/MADEGD/new/ps=32/objective_value_6.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_MADEGD_new_ps=32_6.csv ./results/paper/tai50b/MADEGD/new/ps=32/diversity_6.csv; fi

wait $!
