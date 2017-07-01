#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-sko100d

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/sko100d/GADEGD/new/ps=64/3.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/sko100d/GADEGD/new/ps=64/3.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/sko100d.dat gadegd t 100.0 -ps 64 -c PR -aux -seed 3 -csvf /tmp -csvs GADEGD_new_ps=64_3; mv /tmp/objective_value_GADEGD_new_ps=64_3.csv ./results/paper/sko100d/GADEGD/new/ps=64/objective_value_3.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GADEGD_new_ps=64_3.csv ./results/paper/sko100d/GADEGD/new/ps=64/diversity_3.csv; fi

wait $!
