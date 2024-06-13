from os import getenv
from dotenv import load_dotenv


if __name__ == "__main__":
    load_dotenv()
    PG_USER = getenv("PG_USER")
    PG_PASSWORD = getenv("PG_PASSWORD")
    PG_HOST = getenv("PG_HOST")
    PG_PORT = getenv("PG_PORT")
