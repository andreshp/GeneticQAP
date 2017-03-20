#########################################################################
# Author: Andrés Herrera Poyatos
# Date: April, 2017
# Class for timing executions.
#########################################################################

import time

class Timer(object):

    def __init__(self, verbose=False):
        self.verbose = verbose

    def start(self):
        self.start = time.time()
        self.times = []
        self.working = True

    def save(self):
        self.times.append(time.time()-self.start)

    def record(self):
        return self.times

    def getTime(self):
        return time.time() - self.start
    
    def __enter__(self):
        self.start()
        return self

    def __exit__(self, *args):
        self.working = False
        self.end = time.time()
        self.secs = self.end - self.start
        self.msecs = self.secs * 1000  # millisecs
        if self.verbose:
            print("Elapsed time in ms:", self.msecs)
