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
#$ -o ./results/paper/sko64/MADEGD/new/ps=16/13.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/sko64/MADEGD/new/ps=16/13.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/sko64.dat gadegd t 40.96 -ps 16 -c PR -aux -lsga Best -ls 2optb -seed 13 -csvf /tmp -csvs MADEGD_new_ps=16_13; mv /tmp/objective_value_MADEGD_new_ps=16_13.csv ./results/paper/sko64/MADEGD/new/ps=16/objective_value_13.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_MADEGD_new_ps=16_13.csv ./results/paper/sko64/MADEGD/new/ps=16/diversity_13.csv; fi

wait $!
