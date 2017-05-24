################################################################################
# Author: Andrés Herrera Poyatos
# University of Granada
# Makes a summary of the executions' data.
################################################################################

# Script that extracts and summarizes the information obtained in the executions.

import os
import glob
import numpy as np
import sys
import csv
import re
from pandas import DataFrame, read_csv

num_instances = 20

def sort_df(df, column_idx, key):
    '''Takes dataframe, column index and custom function for sorting, 
    returns dataframe sorted by this column using this function'''
    
    col = df.ix[:,column_idx]
    temp = np.array(col.values.tolist())
    order = sorted(range(len(temp)), key=lambda j: key(temp[j]))
    return df.ix[order]

#-------------------------------- Functions -----------------------------------#

# Build a generator with the name of the files in the given path.
def files(path, regular_exp):
    for f in  glob.glob(path+"/"+regular_exp):
        if os.path.isfile(f):
            yield f

# Build a generator with the name of the directories in the given path.
def directories(path):
    for f in os.listdir(path):
        if os.path.isdir(os.path.join(path, f)):
            yield path+"/"+f

# Obtains for each algorithm and instance a csv with the results.
def firstCSV(directory):
    sols = list(files(directory, "*.sol"))
    if len(sols) > 0:
        times = []
        evaluations = []
        iterations = []
        ovalues = []
        for f in sols:
            sol = open(f)
            l = sol.readline()
            times.append(float(l.split()[2]))
            l = sol.readline()
            evaluations.append(float(l.split()[3]))
            l = sol.readline()
            iterations.append(float(l.split()[3]))
            l = sol.readline()
            ovalues.append(int(l.split()[-2]))

        with open(os.path.join(directory, "results.csv"), 'w') as w:
            writer = csv.writer(w, delimiter=',')
            writer.writerows([("Time", "Evaluations", "Iterations", "Objective value")])
            writer.writerows(zip(times, evaluations, iterations, ovalues))

    for d in directories(directory):
        firstCSV(d)

# Obtains for each algorithm a csv with the average results in every instance.
def algorithmsSummary(directory):
    """ Obtain a summary for each algorithm. """

    # Read the instances' folders in directory.
    instances = list(filter(lambda x: os.path.isdir(os.path.join(directory,x)), os.listdir(directory)))
    algorithms = {}
    for i in instances:
        opt = readOptimum(i)
        summarizeInstance(directory, "", i, algorithms, opt)

    for a in algorithms:
        algorithms[a] = sort_df(algorithms[a],0,key=extractSize)
        algorithms[a].to_csv(os.path.join(directory,a)+".csv", index=False, encoding='utf-8')

def readOptimum(instance):
    """ Reads the best known objective value for the given instance."""
    sol = open("./instances/"+instance+".sln")
    return int(sol.readline().split()[-1])

def extractSize(ninstance):
    return int(re.search(r"\d+", ninstance).group(0))

def summarizeInstance(directory, alg_path, instance, algorithms, opt):
    """ Add to algorithms the results of each algorithm in the given instance.
    It is used in algorithmsSummary.
    """
    # Current path
    path = os.path.join(directory, instance, alg_path)

    # If there is a file with the results, put their averages in algorithms.
    results = list(files(path, "results.csv"))
    if len(results) > 0:
        df = read_csv(os.path.join(path,"results.csv"))
        alg = "-".join(alg_path.split('/'))
        mean_values = df.mean()
        if not alg in algorithms:
            algorithms[alg] = DataFrame(columns=('Instance', 'Time', 'Evaluations', 'Iterations',
                                                 'Objective value', 'Distance to optimum'))
        mean_ovalue = mean_values[-1]
        algorithms[alg].loc[len(algorithms[alg])] = [instance, mean_values[0], mean_values[1],
                                                     mean_values[2], mean_ovalue, 100*float(mean_ovalue - opt)/opt]

    # Call to each directory recursively.
    for d in os.listdir(path):
        new_path = os.path.join(alg_path, d)
        if os.path.isdir(os.path.join(path, d)):
            summarizeInstance(directory, new_path, instance, algorithms, opt)        

def globalSummary(directory):
    summary = DataFrame(columns=('Algorithm', 'Time','Evaluations', 'Iterations', 'Distance to optimum'))
    for f in files(directory, "*.csv"):
        alg_name = f.replace('.csv', '').replace(directory,'')
        if alg_name != "summary":
            df = read_csv(f)
            mean_values = df[1:].mean()
            summary.loc[len(summary)] = [alg_name, mean_values[0], mean_values[1], mean_values[2], mean_values[-1]]
    summary = sort_df(summary,0,key=lambda x: x)
    summary.to_csv(os.path.join(directory, "summary.csv"), index=False, encoding='utf-8')
            
if len(sys.argv) <= 1:
    print("Use: python summary.py <folder>")
    exit()

# Executes the program
#firstCSV(sys.argv[1])
#algorithmsSummary(sys.argv[1])
globalSummary(sys.argv[1])
