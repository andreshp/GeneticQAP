#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-sko100a

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/sko100a/MADEGD/original/ps=16/10.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/sko100a/MADEGD/original/ps=16/10.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/sko100a.dat gadegd t 100 -ps 16 -c PR -aux -lsga Best -ls 2optb -itpls 1 -seed 10 -csvf /tmp -csvs MADEGD_original_ps=16_10; mv /tmp/objective_value_MADEGD_original_ps=16_10.csv ./results/paper/sko100a/MADEGD/original/ps=16/objective_value_10.csv

wait $!
