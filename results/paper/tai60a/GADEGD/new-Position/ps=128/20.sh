#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-tai60a

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/tai60a/GADEGD/new-Position/ps=128/20.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/tai60a/GADEGD/new-Position/ps=128/20.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/tai60a.dat gadegd t 36.0 -ps 128 -c Position -aux -seed 20 -csvf /tmp -csvs GADEGD_new-Position_ps=128_20; mv /tmp/objective_value_GADEGD_new-Position_ps=128_20.csv ./results/paper/tai60a/GADEGD/new-Position/ps=128/objective_value_20.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GADEGD_new-Position_ps=128_20.csv ./results/paper/tai60a/GADEGD/new-Position/ps=128/diversity_20.csv; fi

wait $!
