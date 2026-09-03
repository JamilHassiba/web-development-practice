CREATE TABLE authors (
    author_id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    country TEXT
);

CREATE TABLE genres (
    genre_id SERIAL PRIMARY KEY,
    genre TEXT UNIQUE NOT NULL
);

CREATE TABLE books (
    book_id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    isbn TEXT UNIQUE NOT NULL,
    genre_id INT NOT NULL REFERENCES genres(genre_id),
    price NUMERIC(6, 2) NOT NULL,
    author_id INT NOT NULL REFERENCES authors(author_id)
);

CREATE TABLE copies (
    copy_id SERIAL PRIMARY KEY,
    book_id INT NOT NULL REFERENCES books(book_id),
    availability TEXT CHECK (availability IN ('In stock', 'Borrowed', 'Reserved')) NOT NULL,
    acquired_at DATE DEFAULT CURRENT_DATE
);
