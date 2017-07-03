#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-sko100c

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/sko100c/MA/PMX/17.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/sko100c/MA/PMX/17.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/sko100c.dat gga t 100.0 -ps 60 -c PMX -lsga Best -itpls 1 -ls 2optb -aux -seed 17 -csvf /tmp -csvs MA_PMX_17; mv /tmp/objective_value_MA_PMX_17.csv ./results/paper/sko100c/MA/PMX/objective_value_17.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_MA_PMX_17.csv ./results/paper/sko100c/MA/PMX/diversity_17.csv; fi

wait $!
