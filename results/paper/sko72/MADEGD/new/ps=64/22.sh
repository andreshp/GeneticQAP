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
#$ -o ./results/paper/sko72/MADEGD/new/ps=64/22.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/sko72/MADEGD/new/ps=64/22.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/sko72.dat gadegd t 51.84 -ps 64 -c PR -aux -lsga Best -ls 2optb -seed 22 -csvf /tmp -csvs MADEGD_new_ps=64_22; mv /tmp/objective_value_MADEGD_new_ps=64_22.csv ./results/paper/sko72/MADEGD/new/ps=64/objective_value_22.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_MADEGD_new_ps=64_22.csv ./results/paper/sko72/MADEGD/new/ps=64/diversity_22.csv; fi

wait $!
