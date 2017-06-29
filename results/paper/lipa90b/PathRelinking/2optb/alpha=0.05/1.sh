#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-lipa90b

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/lipa90b/PathRelinking/2optb/alpha=0.05/1.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/lipa90b/PathRelinking/2optb/alpha=0.05/1.log

# Set working directory to the current one
#$ -cwd

python ./code/main_ma.py ./instances/lipa90b.dat pr t 81.0 -gr ind -ls 2optb -gra 0.05 -aux -seed 1 -csvf /tmp -csvs PathRelinking_2optb_alpha=0.05_1; mv /tmp/objective_value_PathRelinking_2optb_alpha=0.05_1.csv ./results/paper/lipa90b/PathRelinking/2optb/alpha=0.05/objective_value_1.csv
 if [[ false -eq true ]] then; mv /tmp/diversity_PathRelinking_2optb_alpha=0.05_1.csv ./results/paper/lipa90b/PathRelinking/2optb/alpha=0.05/diversity_1.csv; fi

wait $!
