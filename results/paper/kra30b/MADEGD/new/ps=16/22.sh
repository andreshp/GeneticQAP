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
#$ -o ./results/paper/kra30b/MADEGD/new/ps=16/22.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/kra30b/MADEGD/new/ps=16/22.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/kra30b.dat gadegd t 9.0 -ps 16 -c PR -aux -lsga Best -ls 2optb -seed 22 -csvf /tmp -csvs MADEGD_new_ps=16_22; mv /tmp/objective_value_MADEGD_new_ps=16_22.csv ./results/paper/kra30b/MADEGD/new/ps=16/objective_value_22.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_MADEGD_new_ps=16_22.csv ./results/paper/kra30b/MADEGD/new/ps=16/diversity_22.csv; fi

wait $!
