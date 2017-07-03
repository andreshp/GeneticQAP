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
#$ -o ./results/paper/sko72/GADEGD/new-Position/ps=128/10.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/sko72/GADEGD/new-Position/ps=128/10.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/sko72.dat gadegd t 51.84 -ps 128 -c Position -aux -seed 10 -csvf /tmp -csvs GADEGD_new-Position_ps=128_10; mv /tmp/objective_value_GADEGD_new-Position_ps=128_10.csv ./results/paper/sko72/GADEGD/new-Position/ps=128/objective_value_10.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GADEGD_new-Position_ps=128_10.csv ./results/paper/sko72/GADEGD/new-Position/ps=128/diversity_10.csv; fi

wait $!
