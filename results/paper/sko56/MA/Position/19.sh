#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-sko56

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/sko56/MA/Position/19.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/sko56/MA/Position/19.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/sko56.dat gga t 31.36 -ps 60 -c Position -lsga Best -itpls 1 -ls 2optb -aux -seed 19 -csvf /tmp -csvs MA_Position_19; mv /tmp/objective_value_MA_Position_19.csv ./results/paper/sko56/MA/Position/objective_value_19.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_MA_Position_19.csv ./results/paper/sko56/MA/Position/diversity_19.csv; fi

wait $!
