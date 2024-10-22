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

#print("Executing GADEGD with different population sizes...")
#ps = [8, 16, 32, 64, 128]
#timer = Timer()
#timer.start()
#for size in ps:
#    sol_dir_suffix = "GADEGD/new-random/ps="+str(size)
#    suffix = sol_dir_suffix.replace("/", "_")
#    sol_dir = os.path.join(sols_dir, sol_dir_suffix)
#    parameters = " ".join(["python", code, instance, "gadegd", execution_type, "-ps", str(size), "-c PR -aux"])
#    execute(parameters, sol_dir, suffix, num_executions, server, True)
#if not server:
#    print("Elapsed time in seconds:", timer.getTime())

#print("Executing GADEGD with different population sizes and the position crossover...")
#ps = [32, 64, 128]
#timer = Timer()
#timer.start()
#for size in ps:
#    sol_dir_suffix = "GADEGD/new-Position/ps="+str(size)
#    suffix = sol_dir_suffix.replace("/", "_")
#    sol_dir = os.path.join(sols_dir, sol_dir_suffix)
#    parameters = " ".join(["python", code, instance, "gadegd", execution_type, "-ps", str(size), "-c Position -aux"])
#    execute(parameters, sol_dir, suffix, num_executions, server, True)
#if not server:
#    print("Elapsed time in seconds:", timer.getTime())

#print("Executing MADEGD with different population sizes...")
#ps = [8, 16, 32, 64, 128]
#timer = Timer()
#timer.start()
#for size in ps:
#    sol_dir_suffix = "MADEGD/new/ps="+str(size)
#    suffix = sol_dir_suffix.replace("/", "_")
#    sol_dir = os.path.join(sols_dir, sol_dir_suffix)
#    parameters = " ".join(["python", code, instance, "gadegd", execution_type, "-ps", str(size), "-c PR -aux",
#                           "-lsga Best -ls 2optb"])
#    execute(parameters, sol_dir, suffix, num_executions, server, True)
#if not server:
#    print("Elapsed time in seconds:", timer.getTime())


print("Executing original GADEGD with different population...")
ps = [32, 64, 128]
timer = Timer()
timer.start()
for size in ps:
    sol_dir_suffix = "GADEGD/new-Position/ps="+str(size)
    suffix = sol_dir_suffix.replace("/", "_")
    sol_dir = os.path.join(sols_dir, sol_dir_suffix)
    parameters = " ".join(["python", code, instance, "gadegd", execution_type, "-ps", str(size), "-c Position -aux"])
    execute(parameters, sol_dir, suffix, num_executions, server, True)
if not server:
    print("Elapsed time in seconds:", timer.getTime())
