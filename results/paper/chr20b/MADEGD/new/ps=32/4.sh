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
#$ -o ./results/paper/chr20b/MADEGD/new/ps=32/4.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/chr20b/MADEGD/new/ps=32/4.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/chr20b.dat gadegd t 4.0 -ps 32 -c PR -aux -lsga Best -ls 2optb -seed 4 -csvf /tmp -csvs MADEGD_new_ps=32_4; mv /tmp/objective_value_MADEGD_new_ps=32_4.csv ./results/paper/chr20b/MADEGD/new/ps=32/objective_value_4.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_MADEGD_new_ps=32_4.csv ./results/paper/chr20b/MADEGD/new/ps=32/diversity_4.csv; fi

wait $!
