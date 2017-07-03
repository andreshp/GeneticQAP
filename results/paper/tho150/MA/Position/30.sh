#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-tho150

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/tho150/MA/Position/30.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/tho150/MA/Position/30.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/tho150.dat gga t 225.0 -ps 60 -c Position -lsga Best -itpls 1 -ls 2optb -aux -seed 30 -csvf /tmp -csvs MA_Position_30; mv /tmp/objective_value_MA_Position_30.csv ./results/paper/tho150/MA/Position/objective_value_30.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_MA_Position_30.csv ./results/paper/tho150/MA/Position/diversity_30.csv; fi

wait $!
