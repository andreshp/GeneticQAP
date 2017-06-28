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
#$ -o ./results/paper/tho150/MADEGD/original/ps=16/2.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/tho150/MADEGD/original/ps=16/2.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/tho150.dat gadegd t 0 -ps 16 -c PR -aux -lsga Best -ls 2optb -itpls 1 -seed 2 -csvf /tmp -csvs MADEGD_original_ps=16_2; mv /tmp/objective_value_MADEGD_original_ps=16_2.csv ./results/paper/tho150/MADEGD/original/ps=16/objective_value_2.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_MADEGD_original_ps=16_2.csv ./results/paper/tho150/MADEGD/original/ps=16/diversity_2.csv; fi

wait $!
