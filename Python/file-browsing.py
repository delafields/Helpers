import os
import shutil
import glob

# working directory
curr_dir = os.getcwd()      # show current working directory
os.listdir(curr_dir)        # show all files in the working directory
os.chdir('~/OtherDir')      # change working directory


# get all files in a directory
glob.glob('/Users/Jerome/Desktop/*')
# [] ['/Users/Jerome/Desktop/untitled folder', '/Users/Jerome/Desktop/Untitled.txt']


# walk
tree = os.walk(curr_dir)
# moves through the sub dirs and creates a generator of tuples
# ('dir', [file1, file2, ...] [subdirectory1, subdirectory2, ...]), 
#    (...), ...


# check existance: returns True or False
os.exists('../rel_path')
os.exists('/home/abs_path')
os.isfile('./file.txt')
os.isdir('./subdir')


# checks permissions: returns True or False
os.access('./some_file', os.F_OK) # File exists? Python 3.6
os.access('./some_file', os.R_OK) # Ok to read? Python 3.6
os.access('./some_file', os.W_OK) # Ok to write? Python 3.6
os.access('./some_file', os.X_OK) # Ok to execute? Python 3.6
os.access('./some_file', os.X_OK | os.W_OK) # Ok to execute or write? Python 3.6


# create and delete files and directories
os.mkdir('./test')  # create a new direcotory
os.rmdir('./test')  # removes an empty direcotory
os.removedirs('./test') # removes nested empty directories
os.remove('file.txt')   # removes an individual file
shutil.rmtree('./test') # removes directory (empty or not empty)

os.rename('./dir_before', './renamed') # renames directory if destination doesn't exist
shutil.move('./dir_before', './renamed') # renames directory always

shutil.copytree('./orig', './copy') # copies a directory recursively
shutil.copyfile('file', 'copy')     # copies a file


# Get files of particular type from directory
files = [f for f in os.listdir(s_pdb_dir) if f.endswith(".txt")]


# Copy and move
shutil.copyfile("/path/to/file", "/path/to/new/file") 
shutil.copy("/path/to/file", "/path/to/directory")
shutil.move("/path/to/file","/path/to/directory")
   

# Check if file or directory exists
os.path.exists("file or directory")
os.path.isfile("file")
os.path.isdir("directory")
    
    
# Working directory and absolute path to files
os.getcwd()
os.path.abspath("file")