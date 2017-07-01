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
#$ -o ./results/paper/lipa90b/MADEGD/new/ps=8/17.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/lipa90b/MADEGD/new/ps=8/17.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/lipa90b.dat gadegd t 81.0 -ps 8 -c PR -aux -lsga Best -ls 2optb -seed 17 -csvf /tmp -csvs MADEGD_new_ps=8_17; mv /tmp/objective_value_MADEGD_new_ps=8_17.csv ./results/paper/lipa90b/MADEGD/new/ps=8/objective_value_17.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_MADEGD_new_ps=8_17.csv ./results/paper/lipa90b/MADEGD/new/ps=8/diversity_17.csv; fi

wait $!
