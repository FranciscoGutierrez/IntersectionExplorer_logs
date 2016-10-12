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
fieldnames = ['name','time','agent', 'user', 'tag', 'items', 'bookmark']
writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
writer.writeheader()

# Begin exploration of logfile

for action in logfile:
    # Find all the items tagged as "type 4" -> User clicks in a column or row...
    if("name" in action):
        name = action["name"]
    if("type" in action):
        if(action["type"] == 4): # If action is type 4...
            if(isinstance(action["setsCombination"][0], list)): # Clean list, if dirty.
                action["setsCombination"] = action["setsCombination"][0]
            agent = 0
            user  = 0
            tag   = 0
            items = len(action["Items"])
            time  = action["time"]
            # Get the combinations (list of intersections)
            for set in action["setsCombination"]: # Find the types (agent, autor or tag)
                if (set["type"]==0): agent +=1    # if agent
                if (set["type"]==1): user +=1     # if user
                if (set["type"]==2): tag   +=1    # if tag
            writer.writerow({'name':name, 'time': time, 'agent': agent, 'user': user, 'tag':tag, 'items': items, 'bookmark': 0})
            # Count the items in the dataset.
            # Set Access to "setsCombination"
            # please...!

# Column explanation.

# what's the name of the user?
# how many entities of agent where active when the user clicked a column/row?
# how many entities of user  where active when the user clicked a column/row?
# how many entities of tag   where active when the user clicked a column/row?
# how many items where in those entities?
# after clicking, did he bookmarked?

# name, agent, user, tag, items, bookmark
