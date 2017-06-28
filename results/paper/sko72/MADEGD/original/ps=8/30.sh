#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-sko72

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/sko72/MADEGD/original/ps=8/30.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/sko72/MADEGD/original/ps=8/30.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/sko72.dat gadegd t 0 -ps 8 -c PR -aux -lsga Best -ls 2optb -itpls 1 -seed 30 -csvf /tmp -csvs MADEGD_original_ps=8_30; mv /tmp/objective_value_MADEGD_original_ps=8_30.csv ./results/paper/sko72/MADEGD/original/ps=8/objective_value_30.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_MADEGD_original_ps=8_30.csv ./results/paper/sko72/MADEGD/original/ps=8/diversity_30.csv; fi

wait $!
