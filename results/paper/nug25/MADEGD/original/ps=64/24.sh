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
#$ -o ./results/paper/nug25/MADEGD/original/ps=64/24.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/nug25/MADEGD/original/ps=64/24.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/nug25.dat gadegd t 0 -ps 64 -c PR -aux -lsga Best -ls 2optb -itpls 1 -seed 24 -csvf /tmp -csvs MADEGD_original_ps=64_24; mv /tmp/objective_value_MADEGD_original_ps=64_24.csv ./results/paper/nug25/MADEGD/original/ps=64/objective_value_24.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_MADEGD_original_ps=64_24.csv ./results/paper/nug25/MADEGD/original/ps=64/diversity_24.csv; fi

wait $!
