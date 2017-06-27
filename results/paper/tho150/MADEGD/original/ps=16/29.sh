#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-tho150

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/tho150/MADEGD/original/ps=16/29.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/tho150/MADEGD/original/ps=16/29.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/tho150.dat gadegd t 225 -ps 16 -c PR -aux -lsga Best -ls 2optb -itpls 1 -seed 29 -csvf /tmp -csvs MADEGD_original_ps=16_29; mv /tmp/objective_value_MADEGD_original_ps=16_29.csv ./results/paper/tho150/MADEGD/original/ps=16/objective_value_29.csv

wait $!
