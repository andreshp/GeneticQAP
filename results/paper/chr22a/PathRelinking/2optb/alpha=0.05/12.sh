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
#$ -o ./results/paper/chr22a/PathRelinking/2optb/alpha=0.05/12.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/chr22a/PathRelinking/2optb/alpha=0.05/12.log

# Set working directory to the current one
#$ -cwd

python ./code/main_ma.py ./instances/chr22a.dat pr t 4.84 -gr ind -ls 2optb -gra 0.05 -aux -seed 12 -csvf /tmp -csvs PathRelinking_2optb_alpha=0.05_12; mv /tmp/objective_value_PathRelinking_2optb_alpha=0.05_12.csv ./results/paper/chr22a/PathRelinking/2optb/alpha=0.05/objective_value_12.csv
 if [[ false -eq true ]] then; mv /tmp/diversity_PathRelinking_2optb_alpha=0.05_12.csv ./results/paper/chr22a/PathRelinking/2optb/alpha=0.05/diversity_12.csv; fi

wait $!
