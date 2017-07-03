#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-chr22a

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/chr22a/GADEGD/new-PMX/ps=32/20.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/chr22a/GADEGD/new-PMX/ps=32/20.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/chr22a.dat gadegd t 4.84 -ps 32 -c PMX -aux -seed 20 -csvf /tmp -csvs GADEGD_new-PMX_ps=32_20; mv /tmp/objective_value_GADEGD_new-PMX_ps=32_20.csv ./results/paper/chr22a/GADEGD/new-PMX/ps=32/objective_value_20.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GADEGD_new-PMX_ps=32_20.csv ./results/paper/chr22a/GADEGD/new-PMX/ps=32/diversity_20.csv; fi

wait $!
