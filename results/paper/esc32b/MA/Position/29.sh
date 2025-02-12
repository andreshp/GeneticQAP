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
#$ -o ./results/paper/esc32b/MA/Position/29.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/esc32b/MA/Position/29.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/esc32b.dat gga t 10.24 -ps 60 -c Position -lsga Best -itpls 1 -ls 2optb -aux -seed 29 -csvf /tmp -csvs MA_Position_29; mv /tmp/objective_value_MA_Position_29.csv ./results/paper/esc32b/MA/Position/objective_value_29.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_MA_Position_29.csv ./results/paper/esc32b/MA/Position/diversity_29.csv; fi

wait $!
