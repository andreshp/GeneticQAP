#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-sko100c

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/sko100c/MADEGD/new/ps=128/18.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/sko100c/MADEGD/new/ps=128/18.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/sko100c.dat gadegd t 100.0 -ps 128 -c PR -aux -lsga Best -ls 2optb -seed 18 -csvf /tmp -csvs MADEGD_new_ps=128_18; mv /tmp/objective_value_MADEGD_new_ps=128_18.csv ./results/paper/sko100c/MADEGD/new/ps=128/objective_value_18.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_MADEGD_new_ps=128_18.csv ./results/paper/sko100c/MADEGD/new/ps=128/diversity_18.csv; fi

wait $!
