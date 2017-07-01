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
#$ -o ./results/paper/tai60a/MADEGD/new/ps=16/18.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/tai60a/MADEGD/new/ps=16/18.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/tai60a.dat gadegd t 36.0 -ps 16 -c PR -aux -lsga Best -ls 2optb -seed 18 -csvf /tmp -csvs MADEGD_new_ps=16_18; mv /tmp/objective_value_MADEGD_new_ps=16_18.csv ./results/paper/tai60a/MADEGD/new/ps=16/objective_value_18.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_MADEGD_new_ps=16_18.csv ./results/paper/tai60a/MADEGD/new/ps=16/diversity_18.csv; fi

wait $!
