#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-sko100a

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/sko100a/MADEGD/new/ps=128/1.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/sko100a/MADEGD/new/ps=128/1.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/sko100a.dat gadegd t 100.0 -ps 128 -c PR -aux -lsga Best -ls 2optb -seed 1 -csvf /tmp -csvs MADEGD_new_ps=128_1; mv /tmp/objective_value_MADEGD_new_ps=128_1.csv ./results/paper/sko100a/MADEGD/new/ps=128/objective_value_1.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_MADEGD_new_ps=128_1.csv ./results/paper/sko100a/MADEGD/new/ps=128/diversity_1.csv; fi

wait $!
