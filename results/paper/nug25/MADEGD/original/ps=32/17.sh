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
#$ -o ./results/paper/nug25/MADEGD/original/ps=32/17.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/nug25/MADEGD/original/ps=32/17.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/nug25.dat gadegd t 6.25 -ps 32 -c PR -aux -lsga Best -ls 2optb -itpls 1 -seed 17 -csvf /tmp -csvs MADEGD_original_ps=32_17; mv /tmp/objective_value_MADEGD_original_ps=32_17.csv ./results/paper/nug25/MADEGD/original/ps=32/objective_value_17.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_MADEGD_original_ps=32_17.csv ./results/paper/nug25/MADEGD/original/ps=32/diversity_17.csv; fi

wait $!
