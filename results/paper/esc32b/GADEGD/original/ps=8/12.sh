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
#$ -o ./results/paper/esc32b/GADEGD/original/ps=8/12.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/esc32b/GADEGD/original/ps=8/12.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/esc32b.dat gadegd t 10.24 -ps 8 -c PR -aux -seed 12 -csvf /tmp -csvs GADEGD_original_ps=8_12; mv /tmp/objective_value_GADEGD_original_ps=8_12.csv ./results/paper/esc32b/GADEGD/original/ps=8/objective_value_12.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GADEGD_original_ps=8_12.csv ./results/paper/esc32b/GADEGD/original/ps=8/diversity_12.csv; fi

wait $!
