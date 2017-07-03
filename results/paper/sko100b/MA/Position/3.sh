#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-sko100b

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/sko100b/MA/Position/3.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/sko100b/MA/Position/3.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/sko100b.dat gga t 100.0 -ps 60 -c Position -lsga Best -itpls 1 -ls 2optb -aux -seed 3 -csvf /tmp -csvs MA_Position_3; mv /tmp/objective_value_MA_Position_3.csv ./results/paper/sko100b/MA/Position/objective_value_3.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_MA_Position_3.csv ./results/paper/sko100b/MA/Position/diversity_3.csv; fi

wait $!
