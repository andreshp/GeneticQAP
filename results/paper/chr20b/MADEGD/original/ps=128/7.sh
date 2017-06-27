#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-chr20b

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/chr20b/MADEGD/original/ps=128/7.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/chr20b/MADEGD/original/ps=128/7.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/chr20b.dat gadegd t 4 -ps 128 -c PR -aux -lsga Best -ls 2optb -itpls 1 -seed 7 -csvf /tmp -csvs MADEGD_original_ps=128_7; mv /tmp/objective_value_MADEGD_original_ps=128_7.csv ./results/paper/chr20b/MADEGD/original/ps=128/objective_value_7.csv

wait $!
