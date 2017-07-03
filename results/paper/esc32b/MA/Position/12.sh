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
#$ -o ./results/paper/esc32b/MA/Position/12.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/esc32b/MA/Position/12.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/esc32b.dat gga t 10.24 -ps 60 -c Position -lsga Best -itpls 1 -ls 2optb -aux -seed 12 -csvf /tmp -csvs MA_Position_12; mv /tmp/objective_value_MA_Position_12.csv ./results/paper/esc32b/MA/Position/objective_value_12.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_MA_Position_12.csv ./results/paper/esc32b/MA/Position/diversity_12.csv; fi

wait $!
