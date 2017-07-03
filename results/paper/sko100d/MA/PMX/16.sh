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
#$ -o ./results/paper/sko100d/MA/PMX/16.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/sko100d/MA/PMX/16.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/sko100d.dat gga t 100.0 -ps 60 -c PMX -lsga Best -itpls 1 -ls 2optb -aux -seed 16 -csvf /tmp -csvs MA_PMX_16; mv /tmp/objective_value_MA_PMX_16.csv ./results/paper/sko100d/MA/PMX/objective_value_16.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_MA_PMX_16.csv ./results/paper/sko100d/MA/PMX/diversity_16.csv; fi

wait $!
