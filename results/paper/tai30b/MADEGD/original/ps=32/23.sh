#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-tai30b

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/tai30b/MADEGD/original/ps=32/23.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/tai30b/MADEGD/original/ps=32/23.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/tai30b.dat gadegd t 9.0 -ps 32 -c PR -aux -lsga Best -ls 2optb -itpls 1 -seed 23 -csvf /tmp -csvs MADEGD_original_ps=32_23; mv /tmp/objective_value_MADEGD_original_ps=32_23.csv ./results/paper/tai30b/MADEGD/original/ps=32/objective_value_23.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_MADEGD_original_ps=32_23.csv ./results/paper/tai30b/MADEGD/original/ps=32/diversity_23.csv; fi

wait $!
