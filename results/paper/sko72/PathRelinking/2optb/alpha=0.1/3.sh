#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-sko72

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/sko72/PathRelinking/2optb/alpha=0.1/3.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/sko72/PathRelinking/2optb/alpha=0.1/3.log

# Set working directory to the current one
#$ -cwd

python ./code/main_ma.py ./instances/sko72.dat pr t 51.84 -gr ind -ls 2optb -gra 0.1 -aux -seed 3 -csvf /tmp -csvs PathRelinking_2optb_alpha=0.1_3; mv /tmp/objective_value_PathRelinking_2optb_alpha=0.1_3.csv ./results/paper/sko72/PathRelinking/2optb/alpha=0.1/objective_value_3.csv
 if [[ false -eq true ]] then; mv /tmp/diversity_PathRelinking_2optb_alpha=0.1_3.csv ./results/paper/sko72/PathRelinking/2optb/alpha=0.1/diversity_3.csv; fi

wait $!
