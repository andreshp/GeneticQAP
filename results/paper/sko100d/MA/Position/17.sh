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
#$ -o ./results/paper/sko100d/MA/Position/17.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/sko100d/MA/Position/17.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/sko100d.dat gga t 100.0 -ps 60 -c Position -lsga Best -itpls 1 -ls 2optb -aux -seed 17 -csvf /tmp -csvs MA_Position_17; mv /tmp/objective_value_MA_Position_17.csv ./results/paper/sko100d/MA/Position/objective_value_17.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_MA_Position_17.csv ./results/paper/sko100d/MA/Position/diversity_17.csv; fi

wait $!
