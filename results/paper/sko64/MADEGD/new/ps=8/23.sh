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
#$ -o ./results/paper/sko64/MADEGD/new/ps=8/23.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/sko64/MADEGD/new/ps=8/23.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/sko64.dat gadegd t 40.96 -ps 8 -c PR -aux -lsga Best -ls 2optb -seed 23 -csvf /tmp -csvs MADEGD_new_ps=8_23; mv /tmp/objective_value_MADEGD_new_ps=8_23.csv ./results/paper/sko64/MADEGD/new/ps=8/objective_value_23.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_MADEGD_new_ps=8_23.csv ./results/paper/sko64/MADEGD/new/ps=8/diversity_23.csv; fi

wait $!
