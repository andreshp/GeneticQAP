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
#$ -o ./results/paper/kra30b/PathRelinking/2optb/alpha=0.05/17.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/kra30b/PathRelinking/2optb/alpha=0.05/17.log

# Set working directory to the current one
#$ -cwd

python ./code/main_ma.py ./instances/kra30b.dat pr t 9.0 -gr ind -ls 2optb -gra 0.05 -aux -seed 17 -csvf /tmp -csvs PathRelinking_2optb_alpha=0.05_17; mv /tmp/objective_value_PathRelinking_2optb_alpha=0.05_17.csv ./results/paper/kra30b/PathRelinking/2optb/alpha=0.05/objective_value_17.csv
 if [[ false -eq true ]] then; mv /tmp/diversity_PathRelinking_2optb_alpha=0.05_17.csv ./results/paper/kra30b/PathRelinking/2optb/alpha=0.05/diversity_17.csv; fi

wait $!
