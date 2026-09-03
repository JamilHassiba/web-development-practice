from pydantic import BaseModel

class AuthorCreate(BaseModel):
    first_name: str
    last_name: str
    country: str | None = None

class AuthorOut(BaseModel):
    author_id: int
    first_name: str
    last_name: str
    country: str | None

class GenreCreate(BaseModel):
    genre: str

class GenreOut(BaseModel):
    genre_id: int
    genre: str
