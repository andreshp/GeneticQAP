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
#$ -o ./results/paper/sko100d/GADEGD/new-random/ps=128/20.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/sko100d/GADEGD/new-random/ps=128/20.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/sko100d.dat gadegd t 100.0 -ps 128 -c PR -aux -seed 20 -csvf /tmp -csvs GADEGD_new-random_ps=128_20; mv /tmp/objective_value_GADEGD_new-random_ps=128_20.csv ./results/paper/sko100d/GADEGD/new-random/ps=128/objective_value_20.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GADEGD_new-random_ps=128_20.csv ./results/paper/sko100d/GADEGD/new-random/ps=128/diversity_20.csv; fi

wait $!
