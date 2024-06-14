"""
Generates reports
"""
from os import getenv
from dotenv import load_dotenv
import psycopg2 as pg2
from helper_functions import create_report


if __name__ == "__main__":
    load_dotenv()
    PG_USER = getenv("PG_USER")
    PG_PASSWORD = getenv("PG_PASSWORD")
    PG_HOST = getenv("PG_HOST")
    PG_PORT = getenv("PG_PORT")
    PG_DB = getenv("PG_DB")

    con = pg2.connect(
        dbname=PG_DB,
        user=PG_USER,
        password=PG_PASSWORD,
        host=PG_HOST,
        port=PG_PORT
    )
    print(type(con))
    create_report(con=con,
                  sql_file="sql_queries/prod_q2.sql",
                  xlsx_out="excel_reports",
                  xlsx_name="prod_report_2")

    con.close()
