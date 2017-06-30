#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-chr22a

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/chr22a/MADEGD/original/ps=16/1.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/chr22a/MADEGD/original/ps=16/1.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/chr22a.dat gadegd t 4.84 -ps 16 -c PR -aux -lsga Best -ls 2optb -itpls 1 -seed 1 -csvf /tmp -csvs MADEGD_original_ps=16_1; mv /tmp/objective_value_MADEGD_original_ps=16_1.csv ./results/paper/chr22a/MADEGD/original/ps=16/objective_value_1.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_MADEGD_original_ps=16_1.csv ./results/paper/chr22a/MADEGD/original/ps=16/diversity_1.csv; fi

wait $!
