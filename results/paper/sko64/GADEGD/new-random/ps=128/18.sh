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
#$ -o ./results/paper/sko64/GADEGD/new-random/ps=128/18.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/sko64/GADEGD/new-random/ps=128/18.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/sko64.dat gadegd t 40.96 -ps 128 -c PR -aux -seed 18 -csvf /tmp -csvs GADEGD_new-random_ps=128_18; mv /tmp/objective_value_GADEGD_new-random_ps=128_18.csv ./results/paper/sko64/GADEGD/new-random/ps=128/objective_value_18.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GADEGD_new-random_ps=128_18.csv ./results/paper/sko64/GADEGD/new-random/ps=128/diversity_18.csv; fi

wait $!
