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
#$ -o ./results/paper/chr20b/GADEGD/new/ps=128/3.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/chr20b/GADEGD/new/ps=128/3.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/chr20b.dat gadegd t 4.0 -ps 128 -c PR -aux -seed 3 -csvf /tmp -csvs GADEGD_new_ps=128_3; mv /tmp/objective_value_GADEGD_new_ps=128_3.csv ./results/paper/chr20b/GADEGD/new/ps=128/objective_value_3.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GADEGD_new_ps=128_3.csv ./results/paper/chr20b/GADEGD/new/ps=128/diversity_3.csv; fi

wait $!
