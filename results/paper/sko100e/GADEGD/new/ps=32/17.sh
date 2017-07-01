#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-sko100e

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/sko100e/GADEGD/new/ps=32/17.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/sko100e/GADEGD/new/ps=32/17.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/sko100e.dat gadegd t 100.0 -ps 32 -c PR -aux -seed 17 -csvf /tmp -csvs GADEGD_new_ps=32_17; mv /tmp/objective_value_GADEGD_new_ps=32_17.csv ./results/paper/sko100e/GADEGD/new/ps=32/objective_value_17.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GADEGD_new_ps=32_17.csv ./results/paper/sko100e/GADEGD/new/ps=32/diversity_17.csv; fi

wait $!
