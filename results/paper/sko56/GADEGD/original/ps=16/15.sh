#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-sko56

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/sko56/GADEGD/original/ps=16/15.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/sko56/GADEGD/original/ps=16/15.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/sko56.dat gadegd t 31.36 -ps 16 -c PR -aux -seed 15 -csvf /tmp -csvs GADEGD_original_ps=16_15; mv /tmp/objective_value_GADEGD_original_ps=16_15.csv ./results/paper/sko56/GADEGD/original/ps=16/objective_value_15.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GADEGD_original_ps=16_15.csv ./results/paper/sko56/GADEGD/original/ps=16/diversity_15.csv; fi

wait $!
