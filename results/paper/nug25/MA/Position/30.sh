#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-nug25

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/nug25/MA/Position/30.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/nug25/MA/Position/30.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/nug25.dat gga t 6.25 -ps 60 -c Position -lsga Best -itpls 1 -ls 2optb -aux -seed 30 -csvf /tmp -csvs MA_Position_30; mv /tmp/objective_value_MA_Position_30.csv ./results/paper/nug25/MA/Position/objective_value_30.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_MA_Position_30.csv ./results/paper/nug25/MA/Position/diversity_30.csv; fi

wait $!
