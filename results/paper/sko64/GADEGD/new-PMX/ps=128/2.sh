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
#$ -o ./results/paper/sko64/GADEGD/new-PMX/ps=128/2.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/sko64/GADEGD/new-PMX/ps=128/2.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/sko64.dat gadegd t 40.96 -ps 128 -c PMX -aux -seed 2 -csvf /tmp -csvs GADEGD_new-PMX_ps=128_2; mv /tmp/objective_value_GADEGD_new-PMX_ps=128_2.csv ./results/paper/sko64/GADEGD/new-PMX/ps=128/objective_value_2.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GADEGD_new-PMX_ps=128_2.csv ./results/paper/sko64/GADEGD/new-PMX/ps=128/diversity_2.csv; fi

wait $!
