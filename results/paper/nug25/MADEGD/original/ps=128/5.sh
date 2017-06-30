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
#$ -o ./results/paper/nug25/MADEGD/original/ps=128/5.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/nug25/MADEGD/original/ps=128/5.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/nug25.dat gadegd t 6.25 -ps 128 -c PR -aux -lsga Best -ls 2optb -itpls 1 -seed 5 -csvf /tmp -csvs MADEGD_original_ps=128_5; mv /tmp/objective_value_MADEGD_original_ps=128_5.csv ./results/paper/nug25/MADEGD/original/ps=128/objective_value_5.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_MADEGD_original_ps=128_5.csv ./results/paper/nug25/MADEGD/original/ps=128/diversity_5.csv; fi

wait $!
