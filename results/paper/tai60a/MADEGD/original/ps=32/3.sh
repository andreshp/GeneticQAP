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
#$ -o ./results/paper/tai60a/MADEGD/original/ps=32/3.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/tai60a/MADEGD/original/ps=32/3.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/tai60a.dat gadegd t 36.0 -ps 32 -c PR -aux -lsga Best -ls 2optb -itpls 1 -seed 3 -csvf /tmp -csvs MADEGD_original_ps=32_3; mv /tmp/objective_value_MADEGD_original_ps=32_3.csv ./results/paper/tai60a/MADEGD/original/ps=32/objective_value_3.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_MADEGD_original_ps=32_3.csv ./results/paper/tai60a/MADEGD/original/ps=32/diversity_3.csv; fi

wait $!
