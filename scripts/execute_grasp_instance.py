################################################################################
# Author: Andrés Herrera Poyatos
# University of Granada
# Script to execute all the GRASP variants.
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
code = "./code/main_ma.py"

#print("Executing GRASP with different alpha values...")
#alpha_values = [0.005, 0.01, 0.05, 0.1, 0.2]
#timer = Timer()
#timer.start()
#for alpha in alpha_values:
#    sol_dir_suffix = "GRASP/2optb/alpha="+str(alpha)
#    suffix = sol_dir_suffix.replace("/", "_")
#    sol_dir = os.path.join(sols_dir, sol_dir_suffix)
#    parameters = " ".join(["python", code, instance, "grasp", execution_type,
#                            "-gr ind", "-ls 2optb -gra", str(alpha), "-aux"])
#    execute(parameters, sol_dir, suffix, num_executions, server)
#if not server:
#    print("Elapsed time in seconds:", timer.getTime())

print("Executing path relinking...")
timer = Timer()
timer.start()
sol_dir_suffix = "PathRelinking/2optb/alpha=0.1"
suffix = sol_dir_suffix.replace("/", "_")
sol_dir = os.path.join(sols_dir, sol_dir_suffix)
parameters = " ".join(["python", code, instance, "pr", execution_type,
                       "-gr ind", "-ls 2optb -gra 0.1 -aux"])
execute(parameters, sol_dir, suffix, num_executions, server)
if not server:
    print("Elapsed time in seconds:", timer.getTime())
