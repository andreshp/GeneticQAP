#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-sko100e

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/sko100e/PathRelinking/2optb/alpha=0.05/7.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/sko100e/PathRelinking/2optb/alpha=0.05/7.log

# Set working directory to the current one
#$ -cwd

python ./code/main_ma.py ./instances/sko100e.dat pr t 100.0 -gr ind -ls 2optb -gra 0.05 -aux -seed 7 -csvf /tmp -csvs PathRelinking_2optb_alpha=0.05_7; mv /tmp/objective_value_PathRelinking_2optb_alpha=0.05_7.csv ./results/paper/sko100e/PathRelinking/2optb/alpha=0.05/objective_value_7.csv
 if [[ false -eq true ]] then; mv /tmp/diversity_PathRelinking_2optb_alpha=0.05_7.csv ./results/paper/sko100e/PathRelinking/2optb/alpha=0.05/diversity_7.csv; fi

wait $!
