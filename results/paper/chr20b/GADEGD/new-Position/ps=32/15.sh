#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-chr20b

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/chr20b/GADEGD/new-Position/ps=32/15.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/chr20b/GADEGD/new-Position/ps=32/15.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/chr20b.dat gadegd t 4.0 -ps 32 -c Position -aux -seed 15 -csvf /tmp -csvs GADEGD_new-Position_ps=32_15; mv /tmp/objective_value_GADEGD_new-Position_ps=32_15.csv ./results/paper/chr20b/GADEGD/new-Position/ps=32/objective_value_15.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GADEGD_new-Position_ps=32_15.csv ./results/paper/chr20b/GADEGD/new-Position/ps=32/diversity_15.csv; fi

wait $!
