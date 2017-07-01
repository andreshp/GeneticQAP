#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-esc32b

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/esc32b/MADEGD/new/ps=32/11.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/esc32b/MADEGD/new/ps=32/11.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/esc32b.dat gadegd t 10.24 -ps 32 -c PR -aux -lsga Best -ls 2optb -seed 11 -csvf /tmp -csvs MADEGD_new_ps=32_11; mv /tmp/objective_value_MADEGD_new_ps=32_11.csv ./results/paper/esc32b/MADEGD/new/ps=32/objective_value_11.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_MADEGD_new_ps=32_11.csv ./results/paper/esc32b/MADEGD/new/ps=32/diversity_11.csv; fi

wait $!
