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
#$ -o ./results/paper/sko100d/MA/PMX/12.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/sko100d/MA/PMX/12.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/sko100d.dat gga t 100.0 -ps 60 -c PMX -lsga Best -itpls 1 -ls 2optb -aux -seed 12 -csvf /tmp -csvs MA_PMX_12; mv /tmp/objective_value_MA_PMX_12.csv ./results/paper/sko100d/MA/PMX/objective_value_12.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_MA_PMX_12.csv ./results/paper/sko100d/MA/PMX/diversity_12.csv; fi

wait $!
