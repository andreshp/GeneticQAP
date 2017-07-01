#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-esc32b

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/esc32b/GADEGD/new/ps=8/17.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/esc32b/GADEGD/new/ps=8/17.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/esc32b.dat gadegd t 10.24 -ps 8 -c PR -aux -seed 17 -csvf /tmp -csvs GADEGD_new_ps=8_17; mv /tmp/objective_value_GADEGD_new_ps=8_17.csv ./results/paper/esc32b/GADEGD/new/ps=8/objective_value_17.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GADEGD_new_ps=8_17.csv ./results/paper/esc32b/GADEGD/new/ps=8/diversity_17.csv; fi

wait $!
