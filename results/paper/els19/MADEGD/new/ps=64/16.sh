#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-els19

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/els19/MADEGD/new/ps=64/16.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/els19/MADEGD/new/ps=64/16.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/els19.dat gadegd t 3.61 -ps 64 -c PR -aux -lsga Best -ls 2optb -seed 16 -csvf /tmp -csvs MADEGD_new_ps=64_16; mv /tmp/objective_value_MADEGD_new_ps=64_16.csv ./results/paper/els19/MADEGD/new/ps=64/objective_value_16.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_MADEGD_new_ps=64_16.csv ./results/paper/els19/MADEGD/new/ps=64/diversity_16.csv; fi

wait $!
