#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-nug25

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/nug25/GADEGD/new-Position/ps=32/23.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/nug25/GADEGD/new-Position/ps=32/23.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/nug25.dat gadegd t 6.25 -ps 32 -c Position -aux -seed 23 -csvf /tmp -csvs GADEGD_new-Position_ps=32_23; mv /tmp/objective_value_GADEGD_new-Position_ps=32_23.csv ./results/paper/nug25/GADEGD/new-Position/ps=32/objective_value_23.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GADEGD_new-Position_ps=32_23.csv ./results/paper/nug25/GADEGD/new-Position/ps=32/diversity_23.csv; fi

wait $!
