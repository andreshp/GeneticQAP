#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-sko64

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/sko64/GADEGD/original/ps=128/19.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/sko64/GADEGD/original/ps=128/19.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/sko64.dat gadegd t 0 -ps 128 -c PR -aux -seed 19 -csvf /tmp -csvs GADEGD_original_ps=128_19; mv /tmp/objective_value_GADEGD_original_ps=128_19.csv ./results/paper/sko64/GADEGD/original/ps=128/objective_value_19.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GADEGD_original_ps=128_19.csv ./results/paper/sko64/GADEGD/original/ps=128/diversity_19.csv; fi

wait $!
