#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-esc32b

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/esc32b/MADEGD/original/ps=128/11.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/esc32b/MADEGD/original/ps=128/11.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/esc32b.dat gadegd t 10 -ps 128 -c PR -aux -lsga Best -ls 2optb -itpls 1 -seed 11 -csvf /tmp -csvs MADEGD_original_ps=128_11; mv /tmp/objective_value_MADEGD_original_ps=128_11.csv ./results/paper/esc32b/MADEGD/original/ps=128/objective_value_11.csv

wait $!
