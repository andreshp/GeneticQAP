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
#$ -o ./results/paper/els19/MADEGD/original/ps=64/20.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/els19/MADEGD/original/ps=64/20.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/els19.dat gadegd t 3.61 -ps 64 -c PR -aux -lsga Best -ls 2optb -itpls 1 -seed 20 -csvf /tmp -csvs MADEGD_original_ps=64_20; mv /tmp/objective_value_MADEGD_original_ps=64_20.csv ./results/paper/els19/MADEGD/original/ps=64/objective_value_20.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_MADEGD_original_ps=64_20.csv ./results/paper/els19/MADEGD/original/ps=64/diversity_20.csv; fi

wait $!
