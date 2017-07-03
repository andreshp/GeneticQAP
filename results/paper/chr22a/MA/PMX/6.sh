#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-chr22a

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/chr22a/MA/PMX/6.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/chr22a/MA/PMX/6.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/chr22a.dat gga t 4.84 -ps 60 -c PMX -lsga Best -itpls 1 -ls 2optb -aux -seed 6 -csvf /tmp -csvs MA_PMX_6; mv /tmp/objective_value_MA_PMX_6.csv ./results/paper/chr22a/MA/PMX/objective_value_6.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_MA_PMX_6.csv ./results/paper/chr22a/MA/PMX/diversity_6.csv; fi

wait $!
