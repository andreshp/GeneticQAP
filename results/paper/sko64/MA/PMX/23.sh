#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-sko64

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/sko64/MA/PMX/23.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/sko64/MA/PMX/23.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/sko64.dat gga t 40.96 -ps 60 -c PMX -lsga Best -itpls 1 -ls 2optb -aux -seed 23 -csvf /tmp -csvs MA_PMX_23; mv /tmp/objective_value_MA_PMX_23.csv ./results/paper/sko64/MA/PMX/objective_value_23.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_MA_PMX_23.csv ./results/paper/sko64/MA/PMX/diversity_23.csv; fi

wait $!
