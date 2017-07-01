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
#$ -o ./results/paper/esc32b/MADEGD/new/ps=64/25.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/esc32b/MADEGD/new/ps=64/25.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/esc32b.dat gadegd t 10.24 -ps 64 -c PR -aux -lsga Best -ls 2optb -seed 25 -csvf /tmp -csvs MADEGD_new_ps=64_25; mv /tmp/objective_value_MADEGD_new_ps=64_25.csv ./results/paper/esc32b/MADEGD/new/ps=64/objective_value_25.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_MADEGD_new_ps=64_25.csv ./results/paper/esc32b/MADEGD/new/ps=64/diversity_25.csv; fi

wait $!
