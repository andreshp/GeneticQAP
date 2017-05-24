#!/bin/bash

################################################################################
# Author: Andrés Herrera Poyatos
# University of Granada
# Script to execute all the experiments.
################################################################################


for instance in `ls ./instances/*.dat`
do
    echo "Executing the algorithms on $instance..."
    python ./scripts/execute_instance.py $instance
done

python ./scripts/summary.py ./results/p1
