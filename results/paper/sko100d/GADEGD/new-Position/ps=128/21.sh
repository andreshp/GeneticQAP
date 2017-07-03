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
#$ -o ./results/paper/sko100d/GADEGD/new-Position/ps=128/21.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/sko100d/GADEGD/new-Position/ps=128/21.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/sko100d.dat gadegd t 100.0 -ps 128 -c Position -aux -seed 21 -csvf /tmp -csvs GADEGD_new-Position_ps=128_21; mv /tmp/objective_value_GADEGD_new-Position_ps=128_21.csv ./results/paper/sko100d/GADEGD/new-Position/ps=128/objective_value_21.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GADEGD_new-Position_ps=128_21.csv ./results/paper/sko100d/GADEGD/new-Position/ps=128/diversity_21.csv; fi

wait $!
