import csv
import json
import sys, getopt
from operator import itemgetter
from pprint import pprint
from itertools import chain


## Preparing script, input, output stuff... etc.
opts, args = getopt.getopt(sys.argv[1:], "hi:o:")

input_file  = ""
output_file = ""
writer = ""

for op, value in opts:
    if op == "-i":
        input_file = value
    elif op == "-o":
        output_file = value
    elif op == "-h":
        usage()
        sys.exit()

# Consume input file (logfiles in json format)
with open(input_file) as json_file:
    logfile = json.load(json_file)

# Prepare output file csv basically...

csvfile =  open(output_file, 'w')
fieldnames = ['name','time','bookmark']
writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
writer.writeheader()

# Begin exploration of logfile

for action in logfile:
    # Find all the items tagged as "type 4" -> User clicks in a column or row...
    if("name" in action):
        name = action["name"]
    if("type" in action):
        if(action["type"] == 7): # If action is type 7 ... Bookmark!
            time  = action["time"]
            # Get the combinations (list of intersections)
            writer.writerow({'name':name, 'time': time})
