#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-kra30b

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/kra30b/GADEGD/new-PMX/ps=128/14.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/kra30b/GADEGD/new-PMX/ps=128/14.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/kra30b.dat gadegd t 9.0 -ps 128 -c PMX -aux -seed 14 -csvf /tmp -csvs GADEGD_new-PMX_ps=128_14; mv /tmp/objective_value_GADEGD_new-PMX_ps=128_14.csv ./results/paper/kra30b/GADEGD/new-PMX/ps=128/objective_value_14.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GADEGD_new-PMX_ps=128_14.csv ./results/paper/kra30b/GADEGD/new-PMX/ps=128/diversity_14.csv; fi

wait $!
