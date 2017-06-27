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
#$ -o ./results/paper/sko64/MADEGD/original/ps=128/13.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/sko64/MADEGD/original/ps=128/13.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/sko64.dat gadegd t 40 -ps 128 -c PR -aux -lsga Best -ls 2optb -itpls 1 -seed 13 -csvf /tmp -csvs MADEGD_original_ps=128_13; mv /tmp/objective_value_MADEGD_original_ps=128_13.csv ./results/paper/sko64/MADEGD/original/ps=128/objective_value_13.csv

wait $!
