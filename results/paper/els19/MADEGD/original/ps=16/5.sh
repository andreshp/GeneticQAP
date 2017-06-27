#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-els19

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/els19/MADEGD/original/ps=16/5.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/els19/MADEGD/original/ps=16/5.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/els19.dat gadegd t 3 -ps 16 -c PR -aux -lsga Best -ls 2optb -itpls 1 -seed 5 -csvf /tmp -csvs MADEGD_original_ps=16_5; mv /tmp/objective_value_MADEGD_original_ps=16_5.csv ./results/paper/els19/MADEGD/original/ps=16/objective_value_5.csv

wait $!
