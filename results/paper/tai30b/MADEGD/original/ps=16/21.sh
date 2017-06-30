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
#$ -o ./results/paper/tai30b/MADEGD/original/ps=16/21.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/tai30b/MADEGD/original/ps=16/21.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/tai30b.dat gadegd t 9.0 -ps 16 -c PR -aux -lsga Best -ls 2optb -itpls 1 -seed 21 -csvf /tmp -csvs MADEGD_original_ps=16_21; mv /tmp/objective_value_MADEGD_original_ps=16_21.csv ./results/paper/tai30b/MADEGD/original/ps=16/objective_value_21.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_MADEGD_original_ps=16_21.csv ./results/paper/tai30b/MADEGD/original/ps=16/diversity_21.csv; fi

wait $!
