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
#$ -o ./results/paper/sko56/MADEGD/new/ps=8/20.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/sko56/MADEGD/new/ps=8/20.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/sko56.dat gadegd t 31.36 -ps 8 -c PR -aux -lsga Best -ls 2optb -seed 20 -csvf /tmp -csvs MADEGD_new_ps=8_20; mv /tmp/objective_value_MADEGD_new_ps=8_20.csv ./results/paper/sko56/MADEGD/new/ps=8/objective_value_20.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_MADEGD_new_ps=8_20.csv ./results/paper/sko56/MADEGD/new/ps=8/diversity_20.csv; fi

wait $!
