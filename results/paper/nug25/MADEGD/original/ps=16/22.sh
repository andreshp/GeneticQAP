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
#$ -o ./results/paper/nug25/MADEGD/original/ps=16/22.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/nug25/MADEGD/original/ps=16/22.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/nug25.dat gadegd t 6.25 -ps 16 -c PR -aux -lsga Best -ls 2optb -itpls 1 -seed 22 -csvf /tmp -csvs MADEGD_original_ps=16_22; mv /tmp/objective_value_MADEGD_original_ps=16_22.csv ./results/paper/nug25/MADEGD/original/ps=16/objective_value_22.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_MADEGD_original_ps=16_22.csv ./results/paper/nug25/MADEGD/original/ps=16/diversity_22.csv; fi

wait $!
