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
#$ -o ./results/paper/lipa90b/MA/PMX/20.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/lipa90b/MA/PMX/20.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/lipa90b.dat gga t 81.0 -ps 60 -c PMX -lsga Best -itpls 1 -ls 2optb -aux -seed 20 -csvf /tmp -csvs MA_PMX_20; mv /tmp/objective_value_MA_PMX_20.csv ./results/paper/lipa90b/MA/PMX/objective_value_20.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_MA_PMX_20.csv ./results/paper/lipa90b/MA/PMX/diversity_20.csv; fi

wait $!
