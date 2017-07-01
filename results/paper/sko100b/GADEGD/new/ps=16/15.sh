#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-sko100b

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/sko100b/GADEGD/new/ps=16/15.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/sko100b/GADEGD/new/ps=16/15.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/sko100b.dat gadegd t 100.0 -ps 16 -c PR -aux -seed 15 -csvf /tmp -csvs GADEGD_new_ps=16_15; mv /tmp/objective_value_GADEGD_new_ps=16_15.csv ./results/paper/sko100b/GADEGD/new/ps=16/objective_value_15.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GADEGD_new_ps=16_15.csv ./results/paper/sko100b/GADEGD/new/ps=16/diversity_15.csv; fi

wait $!
