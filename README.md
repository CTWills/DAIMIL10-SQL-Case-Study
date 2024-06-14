## Overview

This program takes in a folder filled with sql queries and exports the data into xlsx files to create reports.

## Run the program

1. Run the main.py file located in the src folder `python main.py`
2. The name of the excel files will be the name of the .sql file that generated it

## CLI Arguments

There are two required arguments to pass in the command line

- -sp, --sql_path <br>
  The path to the folder where your .sql files are stored

- -0, --xlxs_path <br>
  The path to the folder where your excel files will be saved to
