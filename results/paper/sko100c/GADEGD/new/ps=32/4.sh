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
#$ -o ./results/paper/sko100c/GADEGD/new/ps=32/4.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/sko100c/GADEGD/new/ps=32/4.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/sko100c.dat gadegd t 100.0 -ps 32 -c PR -aux -seed 4 -csvf /tmp -csvs GADEGD_new_ps=32_4; mv /tmp/objective_value_GADEGD_new_ps=32_4.csv ./results/paper/sko100c/GADEGD/new/ps=32/objective_value_4.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GADEGD_new_ps=32_4.csv ./results/paper/sko100c/GADEGD/new/ps=32/diversity_4.csv; fi

wait $!
