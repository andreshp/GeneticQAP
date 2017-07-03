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
#$ -o ./results/paper/lipa90b/MA/Position/14.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/lipa90b/MA/Position/14.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/lipa90b.dat gga t 81.0 -ps 60 -c Position -lsga Best -itpls 1 -ls 2optb -aux -seed 14 -csvf /tmp -csvs MA_Position_14; mv /tmp/objective_value_MA_Position_14.csv ./results/paper/lipa90b/MA/Position/objective_value_14.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_MA_Position_14.csv ./results/paper/lipa90b/MA/Position/diversity_14.csv; fi

wait $!
