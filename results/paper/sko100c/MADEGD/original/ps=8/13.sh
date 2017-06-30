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
#$ -o ./results/paper/sko100c/MADEGD/original/ps=8/13.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/sko100c/MADEGD/original/ps=8/13.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/sko100c.dat gadegd t 100.0 -ps 8 -c PR -aux -lsga Best -ls 2optb -itpls 1 -seed 13 -csvf /tmp -csvs MADEGD_original_ps=8_13; mv /tmp/objective_value_MADEGD_original_ps=8_13.csv ./results/paper/sko100c/MADEGD/original/ps=8/objective_value_13.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_MADEGD_original_ps=8_13.csv ./results/paper/sko100c/MADEGD/original/ps=8/diversity_13.csv; fi

wait $!
