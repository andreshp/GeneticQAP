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
execution_type = "e 50000"
execution_type_2 = "i 24"
sols_dir = "./results/p2/" + ninstance 
num_executions = 1
server = len(sys.argv) > 2
code = "./code/main_ma.py"

print("Executing simulating annealing...")
timer = Timer()
timer.start()
TF = [0.001, -0.001]
t=TF[1]
sol_dir_suffix = "SA/t="+str(t)
suffix = sol_dir_suffix.replace("/", "_")
sol_dir = os.path.join(sols_dir,sol_dir_suffix)
parameters = " ".join(["python ./code/main_ma.py", instance, "sa", execution_type,
                       "-ft", str(t)])
execute(parameters, sol_dir, suffix, num_executions, server)
