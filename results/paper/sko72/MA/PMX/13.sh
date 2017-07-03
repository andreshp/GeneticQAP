#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-sko72

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/sko72/MA/PMX/13.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/sko72/MA/PMX/13.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/sko72.dat gga t 51.84 -ps 60 -c PMX -lsga Best -itpls 1 -ls 2optb -aux -seed 13 -csvf /tmp -csvs MA_PMX_13; mv /tmp/objective_value_MA_PMX_13.csv ./results/paper/sko72/MA/PMX/objective_value_13.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_MA_PMX_13.csv ./results/paper/sko72/MA/PMX/diversity_13.csv; fi

wait $!
