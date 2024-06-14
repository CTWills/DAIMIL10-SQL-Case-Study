"""
Functions to create reports
"""
import psycopg2 as pg2
from psycopg2 import OperationalError
import pandas as pd


def create_report(con, sql_file, xlsx_out, xlsx_name=None):
    """
    Creates a report from a given .sql file and exports the data into a excel file

    Parameters:
        con (psycopg2.extensions.connection): postgresql connection
        sql_file (str): filepath to .sql file containting sql query
        xlsx_out (str): filepath to folder where excel file will be stored
        xlsx_name (str): name of file

    Returns:
        None
    """
    try:
        with con:
            if xlsx_name is None:
                file_name = sql_file.split("/")[-1]
                xlsx_name = file_name.split(".")[0]
            with open(sql_file, "r",
                      encoding="utf-8") as file:
                query = file.read()
                if query:
                    test = pd.read_sql_query(query, con)
                    test.to_excel(f"{xlsx_out}/{xlsx_name}.xlsx")
                    print(f"Created {xlsx_name} excel file!")
    except OperationalError as e:
        print(e)


def create_connection(db, usr, pw, host, port):
    con = pg2.connect(
        dbname=db,
        user=usr,
        password=pw,
        host=host,
        port=port
    )
    return con
