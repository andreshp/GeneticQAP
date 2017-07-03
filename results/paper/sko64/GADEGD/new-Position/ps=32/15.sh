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
#$ -o ./results/paper/sko64/GADEGD/new-Position/ps=32/15.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/sko64/GADEGD/new-Position/ps=32/15.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/sko64.dat gadegd t 40.96 -ps 32 -c Position -aux -seed 15 -csvf /tmp -csvs GADEGD_new-Position_ps=32_15; mv /tmp/objective_value_GADEGD_new-Position_ps=32_15.csv ./results/paper/sko64/GADEGD/new-Position/ps=32/objective_value_15.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GADEGD_new-Position_ps=32_15.csv ./results/paper/sko64/GADEGD/new-Position/ps=32/diversity_15.csv; fi

wait $!
