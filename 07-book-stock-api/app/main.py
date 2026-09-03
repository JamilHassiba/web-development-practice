from fastapi import FastAPI, Depends
from psycopg2.extras import RealDictCursor
from typing import List
from .schemas import AuthorCreate, AuthorOut
from .database import get_db

app = FastAPI()

@app.get("/authors")
def get_authors(conn = Depends(get_db)) -> List[AuthorOut]:
    cursor = conn.cursor(cursor_factory=RealDictCursor)
    cursor.execute("SELECT * FROM authors;")
    rows = cursor.fetchall()
    cursor.close()
    return rows

@app.post("/authors")
def post_authors(author: AuthorCreate, conn = Depends(get_db)) -> AuthorOut:
    cursor = conn.cursor(cursor_factory=RealDictCursor)
    query = """
        INSERT INTO authors (first_name, last_name, country) 
        VALUES (%s, %s, %s)
        RETURNING *;
    """
    data = (author.first_name, author.last_name, author.country)
    cursor.execute(query, data)
    new_author = cursor.fetchone()
    conn.commit()
    cursor.close()
    return new_author
