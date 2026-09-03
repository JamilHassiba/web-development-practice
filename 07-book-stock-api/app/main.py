from fastapi import FastAPI, Depends, HTTPException
from psycopg2.extras import RealDictCursor
from typing import List
from .schemas import *
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

@app.get("/genres")
def get_genres(conn = Depends(get_db)) -> List[GenreOut]:
    cursor = conn.cursor(cursor_factory=RealDictCursor)
    cursor.execute("SELECT * FROM genres;")
    rows = cursor.fetchall()
    cursor.close()
    return rows

@app.post("/genres")
def post_genres(genre: GenreCreate, conn = Depends(get_db)) -> GenreOut:
    cursor = conn.cursor(cursor_factory=RealDictCursor)
    query = """
        INSERT INTO genres (genre) 
        VALUES (%s)
        RETURNING *;
    """
    data = (genre.genre,)
    cursor.execute(query, data)
    new_genre = cursor.fetchone()
    conn.commit()
    cursor.close()
    return new_genre

@app.get("/books")
def get_books(conn = Depends(get_db)) -> List[BookOut]:
    cursor = conn.cursor(cursor_factory=RealDictCursor)
    cursor.execute("SELECT book_id, title, isbn, genre_id, price, author_id FROM books;")
    rows = cursor.fetchall()
    cursor.close()
    return rows

@app.post("/books")
def post_books(book: BookCreate, conn = Depends(get_db)) -> BookOut:
    cursor = conn.cursor(cursor_factory=RealDictCursor)
    query = """
        INSERT INTO books (title, isbn, genre_id, price, author_id) 
        VALUES (%s, %s, %s, %s, %s)
        RETURNING *;
    """
    data = (book.title, book.isbn, book.genre_id, book.price, book.author_id)
    cursor.execute(query, data)
    new_book = cursor.fetchone()
    conn.commit()
    cursor.close()
    return new_book

@app.get("/books/{id}")
def get_book(id: int, conn = Depends(get_db)) -> BookDetail:
    cursor = conn.cursor(cursor_factory=RealDictCursor)
    query = """
        SELECT
            b.book_id,
            b.title,
            b.isbn,
            b.price,
            CONCAT(a.first_name, ' ', a.last_name) AS author_name,
            g.genre
        FROM books AS b
        LEFT JOIN genres AS g ON b.genre_id = g.genre_id 
        LEFT JOIN authors AS a ON b.author_id = a.author_id
        WHERE b.book_id = %s;
    """
    cursor.execute(query, (id,))
    book_detail = cursor.fetchone()
    cursor.close()

    if book_detail is None:
        raise HTTPException(status_code=404, detail="Book not found")

    return book_detail
