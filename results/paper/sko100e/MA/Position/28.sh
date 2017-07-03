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
#$ -o ./results/paper/sko100e/MA/Position/28.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/sko100e/MA/Position/28.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/sko100e.dat gga t 100.0 -ps 60 -c Position -lsga Best -itpls 1 -ls 2optb -aux -seed 28 -csvf /tmp -csvs MA_Position_28; mv /tmp/objective_value_MA_Position_28.csv ./results/paper/sko100e/MA/Position/objective_value_28.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_MA_Position_28.csv ./results/paper/sko100e/MA/Position/diversity_28.csv; fi

wait $!
