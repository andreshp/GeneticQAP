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
#$ -o ./results/paper/sko100b/GADEGD/original/ps=8/29.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/sko100b/GADEGD/original/ps=8/29.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/sko100b.dat gadegd t 100.0 -ps 8 -c PR -aux -seed 29 -csvf /tmp -csvs GADEGD_original_ps=8_29; mv /tmp/objective_value_GADEGD_original_ps=8_29.csv ./results/paper/sko100b/GADEGD/original/ps=8/objective_value_29.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GADEGD_original_ps=8_29.csv ./results/paper/sko100b/GADEGD/original/ps=8/diversity_29.csv; fi

wait $!
