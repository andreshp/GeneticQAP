#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-esc32b

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/esc32b/PathRelinking/2optb/alpha=0.05/10.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/esc32b/PathRelinking/2optb/alpha=0.05/10.log

# Set working directory to the current one
#$ -cwd

python ./code/main_ma.py ./instances/esc32b.dat pr t 10.24 -gr ind -ls 2optb -gra 0.05 -aux -seed 10 -csvf /tmp -csvs PathRelinking_2optb_alpha=0.05_10; mv /tmp/objective_value_PathRelinking_2optb_alpha=0.05_10.csv ./results/paper/esc32b/PathRelinking/2optb/alpha=0.05/objective_value_10.csv
 if [[ false -eq true ]] then; mv /tmp/diversity_PathRelinking_2optb_alpha=0.05_10.csv ./results/paper/esc32b/PathRelinking/2optb/alpha=0.05/diversity_10.csv; fi

wait $!
