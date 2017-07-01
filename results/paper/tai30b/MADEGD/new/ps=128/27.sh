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
#$ -o ./results/paper/tai30b/MADEGD/new/ps=128/27.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/tai30b/MADEGD/new/ps=128/27.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/tai30b.dat gadegd t 9.0 -ps 128 -c PR -aux -lsga Best -ls 2optb -seed 27 -csvf /tmp -csvs MADEGD_new_ps=128_27; mv /tmp/objective_value_MADEGD_new_ps=128_27.csv ./results/paper/tai30b/MADEGD/new/ps=128/objective_value_27.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_MADEGD_new_ps=128_27.csv ./results/paper/tai30b/MADEGD/new/ps=128/diversity_27.csv; fi

wait $!
