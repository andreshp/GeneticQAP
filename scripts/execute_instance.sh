#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

#------------------------------ CHECK PARAMETERS ------------------------------#

if [[ $# -eq 0 ]]; then
    echo "Sintax: ./execute.sh <execution command>"
    exit
fi

#--------------------------------- VARIABLES ----------------------------------#

FILE_NAME="`echo $1 | cut -d' ' -f2 | cut -d'.' -f1`"
DICT=`pwd`; #DICT=${DICT:0:-5}
SCRIPT="$FILE_NAME.sh"
RESULTS=results.sol
ERRORS=results.log

#------------------------------- BUILD SCRIPT ---------------------------------#

echo "#!/bin/bash" > $SCRIPT
echo "" >> $SCRIPT
echo "#################################################" >> $SCRIPT
echo "# Author: Andrés Herrera Poyatos" >> $SCRIPT
echo "# Executes an optimization problem in Hercules" >> $SCRIPT
echo "#################################################" >> $SCRIPT
echo "" >> $SCRIPT
echo "# Name of the job." >> $SCRIPT
echo "#$ -N Optimization-$FILE_NAME" >> $SCRIPT
echo "" >> $SCRIPT
echo "# Queue for the job." >> $SCRIPT
echo "#$ -q media" >> $SCRIPT
echo "" >> $SCRIPT
echo "# File to wich the output is redirected." >> $SCRIPT
echo "#$ -o $RESULTS" >> $SCRIPT
echo "" >> $SCRIPT
echo "# File to wich the error stream is redirected." >> $SCRIPT
echo "#$ -e `echo $ERRORS`" >> $SCRIPT
echo "" >> $SCRIPT
echo "# Set working directory to the current one" >> $SCRIPT
echo "#$ -cwd" >> $SCRIPT
echo "" >> $SCRIPT
echo "python $1 $2" >> $SCRIPT
echo "" >> $SCRIPT
echo "wait \$!" >> $SCRIPT
echo "" >> $SCRIPT

#------------------------------ EXECUTE SCRIPT --------------------------------#

# Executes the script built before
qsub $SCRIPT
