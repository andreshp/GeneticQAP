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
#$ -o ./results/paper/sko100e/GADEGD/original/ps=16/6.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/sko100e/GADEGD/original/ps=16/6.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/sko100e.dat gadegd t 0 -ps 16 -c PR -aux -seed 6 -csvf /tmp -csvs GADEGD_original_ps=16_6; mv /tmp/objective_value_GADEGD_original_ps=16_6.csv ./results/paper/sko100e/GADEGD/original/ps=16/objective_value_6.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GADEGD_original_ps=16_6.csv ./results/paper/sko100e/GADEGD/original/ps=16/diversity_6.csv; fi

wait $!
