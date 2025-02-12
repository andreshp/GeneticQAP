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
#$ -o ./results/paper/sko100c/GADEGD/original/ps=128/16.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/sko100c/GADEGD/original/ps=128/16.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/sko100c.dat gadegd t 100.0 -ps 128 -c PR -aux -seed 16 -csvf /tmp -csvs GADEGD_original_ps=128_16; mv /tmp/objective_value_GADEGD_original_ps=128_16.csv ./results/paper/sko100c/GADEGD/original/ps=128/objective_value_16.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GADEGD_original_ps=128_16.csv ./results/paper/sko100c/GADEGD/original/ps=128/diversity_16.csv; fi

wait $!
