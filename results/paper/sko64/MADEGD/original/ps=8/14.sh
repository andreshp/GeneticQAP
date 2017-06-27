#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-sko64

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/sko64/MADEGD/original/ps=8/14.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/sko64/MADEGD/original/ps=8/14.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/sko64.dat gadegd t 40 -ps 8 -c PR -aux -lsga Best -ls 2optb -itpls 1 -seed 14 -csvf /tmp -csvs MADEGD_original_ps=8_14; mv /tmp/objective_value_MADEGD_original_ps=8_14.csv ./results/paper/sko64/MADEGD/original/ps=8/objective_value_14.csv

wait $!
