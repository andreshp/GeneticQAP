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
#$ -o ./results/paper/sko100e/GADEGD/new/ps=16/10.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/sko100e/GADEGD/new/ps=16/10.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/sko100e.dat gadegd t 100.0 -ps 16 -c PR -aux -seed 10 -csvf /tmp -csvs GADEGD_new_ps=16_10; mv /tmp/objective_value_GADEGD_new_ps=16_10.csv ./results/paper/sko100e/GADEGD/new/ps=16/objective_value_10.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GADEGD_new_ps=16_10.csv ./results/paper/sko100e/GADEGD/new/ps=16/diversity_10.csv; fi

wait $!
