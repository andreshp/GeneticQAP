#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-esc32b

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/esc32b/GADEGD/new-Position/ps=64/29.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/esc32b/GADEGD/new-Position/ps=64/29.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/esc32b.dat gadegd t 10.24 -ps 64 -c Position -aux -seed 29 -csvf /tmp -csvs GADEGD_new-Position_ps=64_29; mv /tmp/objective_value_GADEGD_new-Position_ps=64_29.csv ./results/paper/esc32b/GADEGD/new-Position/ps=64/objective_value_29.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GADEGD_new-Position_ps=64_29.csv ./results/paper/esc32b/GADEGD/new-Position/ps=64/diversity_29.csv; fi

wait $!
