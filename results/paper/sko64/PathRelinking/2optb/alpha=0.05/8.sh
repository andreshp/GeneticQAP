#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-sko64

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/sko64/PathRelinking/2optb/alpha=0.05/8.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/sko64/PathRelinking/2optb/alpha=0.05/8.log

# Set working directory to the current one
#$ -cwd

python ./code/main_ma.py ./instances/sko64.dat pr t 40.96 -gr ind -ls 2optb -gra 0.05 -aux -seed 8 -csvf /tmp -csvs PathRelinking_2optb_alpha=0.05_8; mv /tmp/objective_value_PathRelinking_2optb_alpha=0.05_8.csv ./results/paper/sko64/PathRelinking/2optb/alpha=0.05/objective_value_8.csv
 if [[ false -eq true ]] then; mv /tmp/diversity_PathRelinking_2optb_alpha=0.05_8.csv ./results/paper/sko64/PathRelinking/2optb/alpha=0.05/diversity_8.csv; fi

wait $!
