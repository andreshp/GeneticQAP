#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-chr20b

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/chr20b/MADEGD/new/ps=16/5.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/chr20b/MADEGD/new/ps=16/5.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/chr20b.dat gadegd t 4.0 -ps 16 -c PR -aux -lsga Best -ls 2optb -seed 5 -csvf /tmp -csvs MADEGD_new_ps=16_5; mv /tmp/objective_value_MADEGD_new_ps=16_5.csv ./results/paper/chr20b/MADEGD/new/ps=16/objective_value_5.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_MADEGD_new_ps=16_5.csv ./results/paper/chr20b/MADEGD/new/ps=16/diversity_5.csv; fi

wait $!
