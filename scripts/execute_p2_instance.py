################################################################################
# Author: Andrés Herrera Poyatos
# University of Granada
# Script to execute all the algorithms of the practice 2 in one instance.
################################################################################

import os
import numpy as np
import sys

sys.path.insert(0, './code')

from Timer import Timer

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

def execute(parameters, sol_dir, num_executions):
    for i in range(1, num_executions+1):
        sol = sol_dir + "/"+str(i)+".sol"
        command = " ".join([parameters,"-seed", str(i)])
        os.makedirs(sol_dir, exist_ok = True)
        if server:
            os.system("./code/execute_instance.sh " + command)
        else:
            os.system(command + " > " + sol)
        #os.rename("objective_value.csv", sol_dir + "/objective_value_"+str(i)+".csv")    

#------------------------------------ SA ------------------------------------#

print("Executing simulating annealing...")
timer = Timer()
timer.start()
TF = [0.001, -0.001]
for t in TF:
    sol_dir = os.path.join(sols_dir, "SA/t="+str(t))
    parameters = " ".join(["python ./code/main_ma.py", instance, "sa", execution_type,
                            "-ft", str(t), "-csv"])
    execute(parameters, sol_dir, num_executions)
print("Elapsed time in seconds:", timer.getTime())

#------------------------------------ ILS -----------------------------------#

MP = [-1, 1]
print("Executing ILS...")
timer = Timer()
timer.start()
for mp in MP:
    sol_dir = os.path.join(sols_dir, "ILS/mp="+str(mp))
    parameters = " ".join(["python ./code/main_ma.py", instance, "ils", execution_type_2,
                            "-lsme 50000 -csv"])
    execute(parameters, sol_dir, num_executions)
print("Elapsed time in seconds:", timer.getTime())

#----------------------------------- ILS-ES -----------------------------------#

print("Executing ILS...")
timer = Timer()
timer.start()
sol_dir = os.path.join(sols_dir, "ILS-SA/")
parameters = " ".join(["python ./code/main_ma.py", instance, "ils", execution_type_2,
                        "-ls sa -lsme 50000 -csv"])
execute(parameters, sol_dir, num_executions)
print("Elapsed time in seconds:", timer.getTime())

#------------------------------------ GRASP -----------------------------------#

greedy = ['ind', 'pairs']

print("Executing GRASP...")
timer = Timer()
timer.start()
for g in greedy:
    sol_dir = os.path.join(sols_dir, "GRASP/"+g+"/2optb")
    parameters = " ".join(["python ./code/main_ma.py", instance, "grasp", execution_type_2,
                           "-gr", g, "-ls 2optb -gra 0.3 -lsme 50000 -csv"])
    execute(parameters, sol_dir, num_executions)                           
print("Elapsed time in seconds:", timer.getTime())

print("Executing Randomized Greedy...")
timer = Timer()
timer.start()
for g in greedy:
    sol_dir = os.path.join(sols_dir, "GRASP/"+g+"/none")
    parameters = " ".join(["python ./code/main_ma.py", instance, "grasp i 0",
                            "-gr", g, "-ls none -gra 0.3 -csv"])
    execute(parameters, sol_dir, num_executions)                           
print("Elapsed time in seconds:", timer.getTime())
