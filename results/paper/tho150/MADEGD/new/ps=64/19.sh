#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-tho150

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/tho150/MADEGD/new/ps=64/19.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/tho150/MADEGD/new/ps=64/19.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/tho150.dat gadegd t 225.0 -ps 64 -c PR -aux -lsga Best -ls 2optb -seed 19 -csvf /tmp -csvs MADEGD_new_ps=64_19; mv /tmp/objective_value_MADEGD_new_ps=64_19.csv ./results/paper/tho150/MADEGD/new/ps=64/objective_value_19.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_MADEGD_new_ps=64_19.csv ./results/paper/tho150/MADEGD/new/ps=64/diversity_19.csv; fi

wait $!
