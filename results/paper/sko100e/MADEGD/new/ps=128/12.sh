#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-sko100e

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/sko100e/MADEGD/new/ps=128/12.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/sko100e/MADEGD/new/ps=128/12.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/sko100e.dat gadegd t 100.0 -ps 128 -c PR -aux -lsga Best -ls 2optb -seed 12 -csvf /tmp -csvs MADEGD_new_ps=128_12; mv /tmp/objective_value_MADEGD_new_ps=128_12.csv ./results/paper/sko100e/MADEGD/new/ps=128/objective_value_12.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_MADEGD_new_ps=128_12.csv ./results/paper/sko100e/MADEGD/new/ps=128/diversity_12.csv; fi

wait $!
