#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-sko100b

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/sko100b/MADEGD/original/ps=32/6.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/sko100b/MADEGD/original/ps=32/6.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/sko100b.dat gadegd t 100.0 -ps 32 -c PR -aux -lsga Best -ls 2optb -itpls 1 -seed 6 -csvf /tmp -csvs MADEGD_original_ps=32_6; mv /tmp/objective_value_MADEGD_original_ps=32_6.csv ./results/paper/sko100b/MADEGD/original/ps=32/objective_value_6.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_MADEGD_original_ps=32_6.csv ./results/paper/sko100b/MADEGD/original/ps=32/diversity_6.csv; fi

wait $!
