################################################################################
# Author: Andrés Herrera Poyatos
# University of Granada
# Script to execute all the GADEGD variants.
################################################################################

import os
import numpy as np
import sys
import re

sys.path.insert(0, './code')

from Timer import Timer
from Aux import execute

# Take the argument.
if len(sys.argv) < 2:
    print("Error: Needs an instance as argument")
    sys.exit()

instance = sys.argv[1]
ninstance = instance.replace('.dat', '').split('/')[-1]
instance_size = int(re.findall('\d+', ninstance)[0])
execution_type = "t " + str(instance_size * instance_size * 0.01)
sols_dir = "./results/paper/" + ninstance 
num_executions = 30
server = len(sys.argv) > 2
code = "./code/main.py"


#print("Executing GGA...")
#timer = Timer()
#timer.start()
#sol_dir_suffix = "GGA/PR"
#suffix = sol_dir_suffix.replace("/", "_")
#sol_dir = os.path.join(sols_dir, sol_dir_suffix)
#parameters = " ".join(["python", code, instance, "gga", execution_type, "-ps 60", "-c PR -aux"])
#execute(parameters, sol_dir, suffix, num_executions, server, True)
#if not server:
#    print("Elapsed time in seconds:", timer.getTime())

#print("Executing MA...")
#timer = Timer()
#timer.start()
#sol_dir_suffix = "MA/PR"
#suffix = sol_dir_suffix.replace("/", "_")
#sol_dir = os.path.join(sols_dir, sol_dir_suffix)
#parameters = " ".join(["python", code, instance, "gga", execution_type, "-ps 60", "-c PR -lsga Best -itpls 1 -ls 2optb -aux"])
#execute(parameters, sol_dir, suffix, num_executions, server, True)
#if not server:
#    print("Elapsed time in seconds:", timer.getTime())

print("Executing GGA...")
timer = Timer()
timer.start()
sol_dir_suffix = "GGA/PMX"
suffix = sol_dir_suffix.replace("/", "_")
sol_dir = os.path.join(sols_dir, sol_dir_suffix)
parameters = " ".join(["python", code, instance, "gga", execution_type, "-ps 60", "-c PMX -aux"])
execute(parameters, sol_dir, suffix, num_executions, server, True)
if not server:
    print("Elapsed time in seconds:", timer.getTime())

print("Executing MA...")
timer = Timer()
timer.start()
sol_dir_suffix = "MA/PMX"
suffix = sol_dir_suffix.replace("/", "_")
sol_dir = os.path.join(sols_dir, sol_dir_suffix)
parameters = " ".join(["python", code, instance, "gga", execution_type, "-ps 60", "-c PMX -lsga Best -itpls 1 -ls 2optb -aux"])
execute(parameters, sol_dir, suffix, num_executions, server, True)
if not server:
    print("Elapsed time in seconds:", timer.getTime())

print("Executing GGA...")
timer = Timer()
timer.start()
sol_dir_suffix = "GGA/Position"
suffix = sol_dir_suffix.replace("/", "_")
sol_dir = os.path.join(sols_dir, sol_dir_suffix)
parameters = " ".join(["python", code, instance, "gga", execution_type, "-ps 60", "-c Position -aux"])
execute(parameters, sol_dir, suffix, num_executions, server, True)
if not server:
    print("Elapsed time in seconds:", timer.getTime())

print("Executing MA...")
timer = Timer()
timer.start()
sol_dir_suffix = "MA/Position"
suffix = sol_dir_suffix.replace("/", "_")
sol_dir = os.path.join(sols_dir, sol_dir_suffix)
parameters = " ".join(["python", code, instance, "gga", execution_type, "-ps 60", "-c Position -lsga Best -itpls 1 -ls 2optb -aux"])
execute(parameters, sol_dir, suffix, num_executions, server, True)
if not server:
    print("Elapsed time in seconds:", timer.getTime())
