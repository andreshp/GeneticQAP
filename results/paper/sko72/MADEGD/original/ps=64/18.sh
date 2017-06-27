#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-sko72

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/sko72/MADEGD/original/ps=64/18.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/sko72/MADEGD/original/ps=64/18.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/sko72.dat gadegd t 51 -ps 64 -c PR -aux -lsga Best -ls 2optb -itpls 1 -seed 18 -csvf /tmp -csvs MADEGD_original_ps=64_18; mv /tmp/objective_value_MADEGD_original_ps=64_18.csv ./results/paper/sko72/MADEGD/original/ps=64/objective_value_18.csv

wait $!
