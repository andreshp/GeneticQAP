#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-tai60a

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/tai60a/PathRelinking/2optb/alpha=0.1/6.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/tai60a/PathRelinking/2optb/alpha=0.1/6.log

# Set working directory to the current one
#$ -cwd

python ./code/main_ma.py ./instances/tai60a.dat pr t 36.0 -gr ind -ls 2optb -gra 0.1 -aux -seed 6 -csvf /tmp -csvs PathRelinking_2optb_alpha=0.1_6; mv /tmp/objective_value_PathRelinking_2optb_alpha=0.1_6.csv ./results/paper/tai60a/PathRelinking/2optb/alpha=0.1/objective_value_6.csv
 if [[ false -eq true ]] then; mv /tmp/diversity_PathRelinking_2optb_alpha=0.1_6.csv ./results/paper/tai60a/PathRelinking/2optb/alpha=0.1/diversity_6.csv; fi

wait $!
