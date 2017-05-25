#!/bin/bash

################################################################################
# Author: Andrés Herrera Poyatos
# University of Granada
# Script to execute all the experiments.
################################################################################

#------------------------------ CHECK PARAMETERS ------------------------------#

if [[ $# -ne 2 ]]; then
    echo "Sintax: ./execute.sh <script> <is it in server>"
    exit
fi

if [ "$2" == "true" ]; then
    echo "The executions are thrown to the oge queue."
    server=true
else
    echo "The executions are done in local."
    server=
fi

#------------------------------ THROW EXECUTIONS -------------------------------#

for instance in `ls ./instances/*.dat`
do
    echo "Executing the algorithms on $instance..."
    python $1 $instance $server
done

#python ./scripts/summary.py ./results/p1
