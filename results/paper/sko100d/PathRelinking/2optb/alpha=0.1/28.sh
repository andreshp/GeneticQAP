#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-sko100d

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/sko100d/PathRelinking/2optb/alpha=0.1/28.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/sko100d/PathRelinking/2optb/alpha=0.1/28.log

# Set working directory to the current one
#$ -cwd

python ./code/main_ma.py ./instances/sko100d.dat pr t 100.0 -gr ind -ls 2optb -gra 0.1 -aux -seed 28 -csvf /tmp -csvs PathRelinking_2optb_alpha=0.1_28; mv /tmp/objective_value_PathRelinking_2optb_alpha=0.1_28.csv ./results/paper/sko100d/PathRelinking/2optb/alpha=0.1/objective_value_28.csv
 if [[ false -eq true ]] then; mv /tmp/diversity_PathRelinking_2optb_alpha=0.1_28.csv ./results/paper/sko100d/PathRelinking/2optb/alpha=0.1/diversity_28.csv; fi

wait $!
