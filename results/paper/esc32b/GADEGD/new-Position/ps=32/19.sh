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
#$ -o ./results/paper/esc32b/GADEGD/new-Position/ps=32/19.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/esc32b/GADEGD/new-Position/ps=32/19.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/esc32b.dat gadegd t 10.24 -ps 32 -c Position -aux -seed 19 -csvf /tmp -csvs GADEGD_new-Position_ps=32_19; mv /tmp/objective_value_GADEGD_new-Position_ps=32_19.csv ./results/paper/esc32b/GADEGD/new-Position/ps=32/objective_value_19.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GADEGD_new-Position_ps=32_19.csv ./results/paper/esc32b/GADEGD/new-Position/ps=32/diversity_19.csv; fi

wait $!
