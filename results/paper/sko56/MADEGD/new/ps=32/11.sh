#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-sko56

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/sko56/MADEGD/new/ps=32/11.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/sko56/MADEGD/new/ps=32/11.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/sko56.dat gadegd t 31.36 -ps 32 -c PR -aux -lsga Best -ls 2optb -seed 11 -csvf /tmp -csvs MADEGD_new_ps=32_11; mv /tmp/objective_value_MADEGD_new_ps=32_11.csv ./results/paper/sko56/MADEGD/new/ps=32/objective_value_11.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_MADEGD_new_ps=32_11.csv ./results/paper/sko56/MADEGD/new/ps=32/diversity_11.csv; fi

wait $!
