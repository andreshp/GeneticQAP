#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-chr22a

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/chr22a/MADEGD/original/ps=8/23.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/chr22a/MADEGD/original/ps=8/23.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/chr22a.dat gadegd t 4 -ps 8 -c PR -aux -lsga Best -ls 2optb -itpls 1 -seed 23 -csvf /tmp -csvs MADEGD_original_ps=8_23; mv /tmp/objective_value_MADEGD_original_ps=8_23.csv ./results/paper/chr22a/MADEGD/original/ps=8/objective_value_23.csv

wait $!
