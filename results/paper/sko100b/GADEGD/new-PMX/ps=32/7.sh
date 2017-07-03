#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-sko100b

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/sko100b/GADEGD/new-PMX/ps=32/7.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/sko100b/GADEGD/new-PMX/ps=32/7.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/sko100b.dat gadegd t 100.0 -ps 32 -c PMX -aux -seed 7 -csvf /tmp -csvs GADEGD_new-PMX_ps=32_7; mv /tmp/objective_value_GADEGD_new-PMX_ps=32_7.csv ./results/paper/sko100b/GADEGD/new-PMX/ps=32/objective_value_7.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GADEGD_new-PMX_ps=32_7.csv ./results/paper/sko100b/GADEGD/new-PMX/ps=32/diversity_7.csv; fi

wait $!
