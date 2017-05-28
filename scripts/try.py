import os
import numpy as np
import sys

sys.path.insert(0, './code')

from Timer import Timer
from Aux import execute

# Take the argument.
if len(sys.argv) < 2:
    print("Error: Needs an instance as argument")
    sys.exit()

instance = sys.argv[1]
ninstance = instance.replace('.dat', '').split('/')[-1]
execution_type = "i 24"
sols_dir = "./results/p2/" + ninstance 
num_executions = 30
server = len(sys.argv) > 2
code = "./code/main_ma.py"

print("Executing ILS-ES...")
timer = Timer()
timer.start()
sol_dir_suffix = "ILS-SA-fixed"
suffix = sol_dir_suffix.replace("/", "_")
sol_dir = os.path.join(sols_dir,sol_dir_suffix)
parameters = " ".join(["python", code, instance, "ils", execution_type,
                        "-ls sa -lsme 50000"])
execute(parameters, sol_dir, suffix, num_executions, server)
if not server:
    print("Elapsed time in seconds:", timer.getTime())
