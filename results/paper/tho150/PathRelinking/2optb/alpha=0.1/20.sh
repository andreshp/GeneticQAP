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
#$ -o ./results/paper/tho150/PathRelinking/2optb/alpha=0.1/20.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/tho150/PathRelinking/2optb/alpha=0.1/20.log

# Set working directory to the current one
#$ -cwd

python ./code/main_ma.py ./instances/tho150.dat pr t 225.0 -gr ind -ls 2optb -gra 0.1 -aux -seed 20 -csvf /tmp -csvs PathRelinking_2optb_alpha=0.1_20; mv /tmp/objective_value_PathRelinking_2optb_alpha=0.1_20.csv ./results/paper/tho150/PathRelinking/2optb/alpha=0.1/objective_value_20.csv
 if [[ false -eq true ]] then; mv /tmp/diversity_PathRelinking_2optb_alpha=0.1_20.csv ./results/paper/tho150/PathRelinking/2optb/alpha=0.1/diversity_20.csv; fi

wait $!
