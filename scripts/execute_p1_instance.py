################################################################################
# Author: Andrés Herrera Poyatos
# University of Granada
# Script to execute all the algorithms of the practice 1 in one instance.
################################################################################

import os
import numpy as np
import sys

# Take the argument.
if len(sys.argv) < 2:
    print("Error: Needs an instance as argument")
    sys.exit()

instance = sys.argv[1]
ninstance = instance.replace('.dat', '').split('/')[-1]
execution_type = "e 50000"
sols_dir = "./results/p1/" + ninstance 

#----------------------------- GENETIC EXECUTIONS -----------------------------#

gas = ['gga', 'sga']
lsga = ['None', 'Random', 'Best', 'All']
crossover = ['Position', 'PMX', 'OX']

for a in gas:
    for l in lsga:
        if a != 'sga' or l == 'None':
            for c in crossover:
                sol_dir = os.path.join(sols_dir, a, l, c)
                sol = sol_dir + "/1.sol"
                os.makedirs(sol_dir, exist_ok = True)
                os.system(" ".join(["python ./code/main.py", instance, a, execution_type,
                                    "-c", c, "-lsga", l, "-ps 50" if l == 'None' else "-ps 10",
                                    " -ls 2optb -itpls 10 -lsp 0.1 -lsme 400 -csv -seed 28 >", sol]))
                os.rename("objective_value.csv", sol_dir + "/objective_value_1.csv")
                os.rename("Diversity.csv", sol_dir + "/Diversity_1.csv")

#----------------------------- OTHER EXECUTIONS -----------------------------#

greedy = ['greedy1', 'greedy2']
ls = ['None', '2optb', '2opt']

for a in greedy:
    for l in ls:
        sol_dir = os.path.join(sols_dir, a, l)
        sol = sol_dir + "/1.sol"
        os.makedirs(sol_dir, exist_ok = True)
        os.system(" ".join(["python ./code/main.py", instance, a, execution_type,
                            "-ls", l, "-lsme 50000 -csv -seed 28 >", sol]))  
        os.rename("objective_value.csv", sol_dir + "/objective_value_1.csv")
