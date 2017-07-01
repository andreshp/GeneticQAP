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
#$ -o ./results/paper/sko100e/GADEGD/new/ps=8/24.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/sko100e/GADEGD/new/ps=8/24.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/sko100e.dat gadegd t 100.0 -ps 8 -c PR -aux -seed 24 -csvf /tmp -csvs GADEGD_new_ps=8_24; mv /tmp/objective_value_GADEGD_new_ps=8_24.csv ./results/paper/sko100e/GADEGD/new/ps=8/objective_value_24.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GADEGD_new_ps=8_24.csv ./results/paper/sko100e/GADEGD/new/ps=8/diversity_24.csv; fi

wait $!
