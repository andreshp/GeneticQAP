#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-chr22a

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/chr22a/MADEGD/new/ps=16/17.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/chr22a/MADEGD/new/ps=16/17.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/chr22a.dat gadegd t 4.84 -ps 16 -c PR -aux -lsga Best -ls 2optb -seed 17 -csvf /tmp -csvs MADEGD_new_ps=16_17; mv /tmp/objective_value_MADEGD_new_ps=16_17.csv ./results/paper/chr22a/MADEGD/new/ps=16/objective_value_17.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_MADEGD_new_ps=16_17.csv ./results/paper/chr22a/MADEGD/new/ps=16/diversity_17.csv; fi

wait $!
