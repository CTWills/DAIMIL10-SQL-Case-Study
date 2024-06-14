"""
Generates reports
"""
import os
import argparse
from dotenv import load_dotenv
from helper_functions import create_report, create_connection


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("-sp", "--sql_path",
                        help="Path to folder containing sql queries")
    parser.add_argument("-o", "--xlxs_path",
                        help="Path to folder to store excel files")
    args = parser.parse_args()

    sql_dir = args.sql_path
    out_dir = args.xlxs_path

    load_dotenv()
    PG_USER = os.getenv("PG_USER")
    PG_PASSWORD = os.getenv("PG_PASSWORD")
    PG_HOST = os.getenv("PG_HOST")
    PG_PORT = os.getenv("PG_PORT")
    PG_DB = os.getenv("PG_DB")

    con = create_connection(PG_DB, PG_USER, PG_PASSWORD, PG_HOST, PG_PORT)

    for ix, file in enumerate(os.listdir(sql_dir)):
        create_report(con=con,
                      sql_file=f"{sql_dir}/{file}",
                      xlsx_out=out_dir)

    con.close()
