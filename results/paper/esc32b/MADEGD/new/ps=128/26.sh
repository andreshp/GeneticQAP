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
#$ -o ./results/paper/esc32b/MADEGD/new/ps=128/26.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/esc32b/MADEGD/new/ps=128/26.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/esc32b.dat gadegd t 10.24 -ps 128 -c PR -aux -lsga Best -ls 2optb -seed 26 -csvf /tmp -csvs MADEGD_new_ps=128_26; mv /tmp/objective_value_MADEGD_new_ps=128_26.csv ./results/paper/esc32b/MADEGD/new/ps=128/objective_value_26.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_MADEGD_new_ps=128_26.csv ./results/paper/esc32b/MADEGD/new/ps=128/diversity_26.csv; fi

wait $!
