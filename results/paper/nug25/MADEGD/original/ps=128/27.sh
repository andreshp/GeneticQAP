#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-nug25

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/nug25/MADEGD/original/ps=128/27.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/nug25/MADEGD/original/ps=128/27.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/nug25.dat gadegd t 6 -ps 128 -c PR -aux -lsga Best -ls 2optb -itpls 1 -seed 27 -csvf /tmp -csvs MADEGD_original_ps=128_27; mv /tmp/objective_value_MADEGD_original_ps=128_27.csv ./results/paper/nug25/MADEGD/original/ps=128/objective_value_27.csv

wait $!
