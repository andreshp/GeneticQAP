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
#$ -o ./results/paper/sko100e/MA/PMX/4.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/sko100e/MA/PMX/4.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/sko100e.dat gga t 100.0 -ps 60 -c PMX -lsga Best -itpls 1 -ls 2optb -aux -seed 4 -csvf /tmp -csvs MA_PMX_4; mv /tmp/objective_value_MA_PMX_4.csv ./results/paper/sko100e/MA/PMX/objective_value_4.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_MA_PMX_4.csv ./results/paper/sko100e/MA/PMX/diversity_4.csv; fi

wait $!
