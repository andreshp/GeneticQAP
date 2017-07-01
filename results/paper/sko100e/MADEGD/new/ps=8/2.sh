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
#$ -o ./results/paper/sko100e/MADEGD/new/ps=8/2.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/sko100e/MADEGD/new/ps=8/2.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/sko100e.dat gadegd t 100.0 -ps 8 -c PR -aux -lsga Best -ls 2optb -seed 2 -csvf /tmp -csvs MADEGD_new_ps=8_2; mv /tmp/objective_value_MADEGD_new_ps=8_2.csv ./results/paper/sko100e/MADEGD/new/ps=8/objective_value_2.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_MADEGD_new_ps=8_2.csv ./results/paper/sko100e/MADEGD/new/ps=8/diversity_2.csv; fi

wait $!
