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
#$ -o ./results/paper/chr22a/MADEGD/original/ps=8/21.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/chr22a/MADEGD/original/ps=8/21.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/chr22a.dat gadegd t 4 -ps 8 -c PR -aux -lsga Best -ls 2optb -itpls 1 -seed 21 -csvf /tmp -csvs MADEGD_original_ps=8_21; mv /tmp/objective_value_MADEGD_original_ps=8_21.csv ./results/paper/chr22a/MADEGD/original/ps=8/objective_value_21.csv

wait $!
