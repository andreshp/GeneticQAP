#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-lipa90b

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/lipa90b/MADEGD/original/ps=16/9.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/lipa90b/MADEGD/original/ps=16/9.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/lipa90b.dat gadegd t 81.0 -ps 16 -c PR -aux -lsga Best -ls 2optb -itpls 1 -seed 9 -csvf /tmp -csvs MADEGD_original_ps=16_9; mv /tmp/objective_value_MADEGD_original_ps=16_9.csv ./results/paper/lipa90b/MADEGD/original/ps=16/objective_value_9.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_MADEGD_original_ps=16_9.csv ./results/paper/lipa90b/MADEGD/original/ps=16/diversity_9.csv; fi

wait $!
