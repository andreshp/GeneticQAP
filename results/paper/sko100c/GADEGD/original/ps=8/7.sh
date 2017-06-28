#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-sko100c

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/sko100c/GADEGD/original/ps=8/7.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/sko100c/GADEGD/original/ps=8/7.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/sko100c.dat gadegd t 0 -ps 8 -c PR -aux -seed 7 -csvf /tmp -csvs GADEGD_original_ps=8_7; mv /tmp/objective_value_GADEGD_original_ps=8_7.csv ./results/paper/sko100c/GADEGD/original/ps=8/objective_value_7.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GADEGD_original_ps=8_7.csv ./results/paper/sko100c/GADEGD/original/ps=8/diversity_7.csv; fi

wait $!
