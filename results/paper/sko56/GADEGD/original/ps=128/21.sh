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
#$ -o ./results/paper/sko56/GADEGD/original/ps=128/21.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/sko56/GADEGD/original/ps=128/21.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/sko56.dat gadegd t 0 -ps 128 -c PR -aux -seed 21 -csvf /tmp -csvs GADEGD_original_ps=128_21; mv /tmp/objective_value_GADEGD_original_ps=128_21.csv ./results/paper/sko56/GADEGD/original/ps=128/objective_value_21.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GADEGD_original_ps=128_21.csv ./results/paper/sko56/GADEGD/original/ps=128/diversity_21.csv; fi

wait $!
