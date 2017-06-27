#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-sko56

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/sko56/MADEGD/original/ps=32/26.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/sko56/MADEGD/original/ps=32/26.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/sko56.dat gadegd t 31 -ps 32 -c PR -aux -lsga Best -ls 2optb -itpls 1 -seed 26 -csvf /tmp -csvs MADEGD_original_ps=32_26; mv /tmp/objective_value_MADEGD_original_ps=32_26.csv ./results/paper/sko56/MADEGD/original/ps=32/objective_value_26.csv

wait $!
