#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-nug25

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/nug25/MADEGD/new/ps=16/12.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/nug25/MADEGD/new/ps=16/12.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/nug25.dat gadegd t 6.25 -ps 16 -c PR -aux -lsga Best -ls 2optb -seed 12 -csvf /tmp -csvs MADEGD_new_ps=16_12; mv /tmp/objective_value_MADEGD_new_ps=16_12.csv ./results/paper/nug25/MADEGD/new/ps=16/objective_value_12.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_MADEGD_new_ps=16_12.csv ./results/paper/nug25/MADEGD/new/ps=16/diversity_12.csv; fi

wait $!
