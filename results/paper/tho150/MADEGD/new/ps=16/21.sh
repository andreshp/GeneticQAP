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
#$ -o ./results/paper/tho150/MADEGD/new/ps=16/21.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/tho150/MADEGD/new/ps=16/21.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/tho150.dat gadegd t 225.0 -ps 16 -c PR -aux -lsga Best -ls 2optb -seed 21 -csvf /tmp -csvs MADEGD_new_ps=16_21; mv /tmp/objective_value_MADEGD_new_ps=16_21.csv ./results/paper/tho150/MADEGD/new/ps=16/objective_value_21.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_MADEGD_new_ps=16_21.csv ./results/paper/tho150/MADEGD/new/ps=16/diversity_21.csv; fi

wait $!
