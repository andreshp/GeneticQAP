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
#$ -o ./results/paper/chr20b/GADEGD/new-Position/ps=64/27.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/chr20b/GADEGD/new-Position/ps=64/27.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/chr20b.dat gadegd t 4.0 -ps 64 -c Position -aux -seed 27 -csvf /tmp -csvs GADEGD_new-Position_ps=64_27; mv /tmp/objective_value_GADEGD_new-Position_ps=64_27.csv ./results/paper/chr20b/GADEGD/new-Position/ps=64/objective_value_27.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GADEGD_new-Position_ps=64_27.csv ./results/paper/chr20b/GADEGD/new-Position/ps=64/diversity_27.csv; fi

wait $!
