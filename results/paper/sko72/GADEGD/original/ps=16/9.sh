#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-sko72

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/sko72/GADEGD/original/ps=16/9.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/sko72/GADEGD/original/ps=16/9.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/sko72.dat gadegd t 51.84 -ps 16 -c PR -aux -seed 9 -csvf /tmp -csvs GADEGD_original_ps=16_9; mv /tmp/objective_value_GADEGD_original_ps=16_9.csv ./results/paper/sko72/GADEGD/original/ps=16/objective_value_9.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GADEGD_original_ps=16_9.csv ./results/paper/sko72/GADEGD/original/ps=16/diversity_9.csv; fi

wait $!
