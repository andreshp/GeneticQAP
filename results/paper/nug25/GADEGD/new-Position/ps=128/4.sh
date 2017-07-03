#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

# Name of the job.
#$ -N Opt-nug25

# Queue for the job.
#$ -q larga

# File to wich the output is redirected.
#$ -o ./results/paper/nug25/GADEGD/new-Position/ps=128/4.sol

# File to wich the error stream is redirected.
#$ -e ./results/paper/nug25/GADEGD/new-Position/ps=128/4.log

# Set working directory to the current one
#$ -cwd

python ./code/main.py ./instances/nug25.dat gadegd t 6.25 -ps 128 -c Position -aux -seed 4 -csvf /tmp -csvs GADEGD_new-Position_ps=128_4; mv /tmp/objective_value_GADEGD_new-Position_ps=128_4.csv ./results/paper/nug25/GADEGD/new-Position/ps=128/objective_value_4.csv
 if [[ true -eq true ]] then; mv /tmp/diversity_GADEGD_new-Position_ps=128_4.csv ./results/paper/nug25/GADEGD/new-Position/ps=128/diversity_4.csv; fi

wait $!
