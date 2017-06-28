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
#$ -o ./results/paper/sko100e/MADEGD/original/ps=32/12.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/sko100e/MADEGD/original/ps=32/12.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/sko100e.dat gadegd t 0 -ps 32 -c PR -aux -lsga Best -ls 2optb -itpls 1 -seed 12 -csvf /tmp -csvs MADEGD_original_ps=32_12; mv /tmp/objective_value_MADEGD_original_ps=32_12.csv ./results/paper/sko100e/MADEGD/original/ps=32/objective_value_12.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_MADEGD_original_ps=32_12.csv ./results/paper/sko100e/MADEGD/original/ps=32/diversity_12.csv; fi

wait $!
