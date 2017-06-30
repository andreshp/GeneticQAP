#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-kra30b

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/kra30b/MADEGD/original/ps=64/18.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/kra30b/MADEGD/original/ps=64/18.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/kra30b.dat gadegd t 9.0 -ps 64 -c PR -aux -lsga Best -ls 2optb -itpls 1 -seed 18 -csvf /tmp -csvs MADEGD_original_ps=64_18; mv /tmp/objective_value_MADEGD_original_ps=64_18.csv ./results/paper/kra30b/MADEGD/original/ps=64/objective_value_18.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_MADEGD_original_ps=64_18.csv ./results/paper/kra30b/MADEGD/original/ps=64/diversity_18.csv; fi

wait $!
