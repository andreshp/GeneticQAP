#!/bin/bash

#################################################
# Author: Andrés Herrera Poyatos
# Executes an optimization problem in Hercules
#################################################

#------------------------------ CHECK PARAMETERS ------------------------------#

if [[ $# -eq 0 ]]; then
    echo "Sintax: ./execute.sh <folder> <name> <execution command>"
    exit
fi

#--------------------------------- VARIABLES ----------------------------------#

INSTANCE="`echo $@ | cut -d' ' -f5 | cut -d'/' -f3 | cut -d'.' -f1`"
FILE_NAME=$2
DICT=$1 #`pwd`; #DICT=${DICT:0:-5} 
SCRIPT=$FILE_NAME.sh
RESULTS=$FILE_NAME.sol
ERRORS=$FILE_NAME.log
COMMAND="`echo $@ | cut -d' ' -f3-`"

#------------------------------- BUILD SCRIPT ---------------------------------#

echo "#!/bin/bash" > $SCRIPT
echo "" >> $SCRIPT
echo "#################################################" >> $SCRIPT
echo "# Author: Andrés Herrera Poyatos" >> $SCRIPT
echo "# Executes an optimization problem in Hercules" >> $SCRIPT
echo "#################################################" >> $SCRIPT
echo "" >> $SCRIPT
echo "# Name of the job." >> $SCRIPT
echo "#$ -N Opt-$INSTANCE" >> $SCRIPT
echo "" >> $SCRIPT
echo "# Queue for the job." >> $SCRIPT
echo "#$ -q media" >> $SCRIPT
echo "" >> $SCRIPT
echo "# File to wich the output is redirected." >> $SCRIPT
echo "#$ -o $DICT/$RESULTS" >> $SCRIPT
echo "" >> $SCRIPT
echo "# File to wich the error stream is redirected." >> $SCRIPT
echo "#$ -e `echo $DICT/$ERRORS`" >> $SCRIPT
echo "" >> $SCRIPT
echo "# Set working directory to the current one" >> $SCRIPT
echo "#$ -cwd" >> $SCRIPT
echo "" >> $SCRIPT
echo "$COMMAND" >> $SCRIPT
echo "" >> $SCRIPT
echo "wait \$!" >> $SCRIPT
echo "" >> $SCRIPT

#------------------------------ EXECUTE SCRIPT --------------------------------#

# Executes the script built before
qsub $SCRIPT
