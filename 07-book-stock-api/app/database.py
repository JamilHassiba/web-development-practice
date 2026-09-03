from dotenv import load_dotenv
from psycopg2 import pool
import os

load_dotenv()
DATABASE_URL = os.getenv("DATABASE_URL")

connection_pool = pool.SimpleConnectionPool(
    1, 10,  # min and max connections
    DATABASE_URL
)

def get_db():
    conn = connection_pool.getconn()
    try:
        yield conn
    finally:
        connection_pool.putconn(conn)
