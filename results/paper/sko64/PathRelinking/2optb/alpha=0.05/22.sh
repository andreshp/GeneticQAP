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
#$ -o ./results/paper/sko64/PathRelinking/2optb/alpha=0.05/22.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/sko64/PathRelinking/2optb/alpha=0.05/22.log

# Set working directory to the current one
#$ -cwd

python ./code/main_ma.py ./instances/sko64.dat pr t 40.96 -gr ind -ls 2optb -gra 0.05 -aux -seed 22 -csvf /tmp -csvs PathRelinking_2optb_alpha=0.05_22; mv /tmp/objective_value_PathRelinking_2optb_alpha=0.05_22.csv ./results/paper/sko64/PathRelinking/2optb/alpha=0.05/objective_value_22.csv
 if [[ false -eq true ]] then; mv /tmp/diversity_PathRelinking_2optb_alpha=0.05_22.csv ./results/paper/sko64/PathRelinking/2optb/alpha=0.05/diversity_22.csv; fi

wait $!
