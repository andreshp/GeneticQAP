#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-sko64

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/sko64/MADEGD/original/ps=16/20.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/sko64/MADEGD/original/ps=16/20.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/sko64.dat gadegd t 40.96 -ps 16 -c PR -aux -lsga Best -ls 2optb -itpls 1 -seed 20 -csvf /tmp -csvs MADEGD_original_ps=16_20; mv /tmp/objective_value_MADEGD_original_ps=16_20.csv ./results/paper/sko64/MADEGD/original/ps=16/objective_value_20.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_MADEGD_original_ps=16_20.csv ./results/paper/sko64/MADEGD/original/ps=16/diversity_20.csv; fi

wait $!
