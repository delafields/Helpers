import sys

def error(msg):
    """Prints error message and quits the program"""
    sys.exit(msg)

args = sys.argv[1:] # NOTE sys.argv[0] is the name of the python script

try:
    arg1 = int(args[0])
    arg2 = args[1]
    arg3 = args[2]
    print("We good")

except ValueError:
    error("First arg must be an int!")

except IndexError:
    error("Requires 3 arguments!")

# >> py command-line-args.py 1 2 3
# [] We good!

# >> py command-line-args.py a 2 3
# [] SystemExit: First argument must be an int!