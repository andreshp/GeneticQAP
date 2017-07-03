#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-lipa90b

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/lipa90b/GADEGD/new-Position/ps=128/20.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/lipa90b/GADEGD/new-Position/ps=128/20.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/lipa90b.dat gadegd t 81.0 -ps 128 -c Position -aux -seed 20 -csvf /tmp -csvs GADEGD_new-Position_ps=128_20; mv /tmp/objective_value_GADEGD_new-Position_ps=128_20.csv ./results/paper/lipa90b/GADEGD/new-Position/ps=128/objective_value_20.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GADEGD_new-Position_ps=128_20.csv ./results/paper/lipa90b/GADEGD/new-Position/ps=128/diversity_20.csv; fi

wait $!
