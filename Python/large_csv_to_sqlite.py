# This dumps a large CSV that doesn't fit in RAM into an SQLite database using pandas

import pandas as pd
import sqlite3
from pandas.io import sql
import subprocess

# In and Out file paths
in_csv = '../data/my_large.csv'
out_sqlite = '../data/my.sqlite'

table_name = 'my_table'     # name for the SQLite database table
chunksize = 100000          # number of lines to process at each iteration

# column names from the CSV file
columns ['cname1', 'cname2', 'cname3']

# Get number of lines in the CSV file
nlines = subprocess.check_output(['wc', '-l', in_csv])
nlines = int(nlines.split()[0])

# connect to the database
cnx = sqlite3.connect(out_sqlite)

# Iteratively read CSV and dump lines into SQLite table
for i in range(0, nlines, chunksize): # change 0 -> 1 if your csv file contains a header

    df = pd.read_csv(in_csv,
                     header=None, # no header, define column header manually later
                     nrows=chunksize, # number of rows to read at each iteration
                     skiprows=i) # skip rows that were already read

    # columns to read
    df.columns = columns

    sql.to_sql(df,
                name=table_name,
                con=cnx,
                index=False, # dont use CSV file index
                index_label='cname1', # use a unique column from DataFrame as index
                if_exists='append')

cnx.close()