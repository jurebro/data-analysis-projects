/* # SQL Part 4 Studio

You are back at the bookstore helping employees with their inventory of books.  Four employees need your 
help with finding books to create in-store displays. Read their requests and decide if you want to use a 
correlated subquery, nested subquery, UNION operator, EXCEPT operator, or INTERSECT operator. 

!!! You may not use any joins or add multiple statements to the WHERE clause unless explicitly asked. !!!

*/

USE BooksDB

-- ==========
-- = WILLOW =
-- ==========
/*
Q1. Willow wants a list of book titles that have multiple authors attributed to them. Write a query to return 
her desired results. */

USE BooksDB
SELECT title, authors
FROM dbo.books
WHERE authors LIKE '%,%';
 
-- =======
-- = IRA =
-- =======
/*
Q2. Ira was asked by a customer for titles that have been tagged "Meditation". As you create a query for Ira, 
think about how the tables in BooksDB are organized as you write your query.*/

WITH meditation_ids AS (
    SELECT goodreads_book_id
    FROM dbo.book_tags
    WHERE tag_id = (
        SELECT tag_id
        FROM dbo.tags
        WHERE tag_name LIKE 'Meditation')
    )
SELECT title AS 'Title', authors as 'Author(s)', original_publication_year AS 'Publication Year', average_rating AS 'Avg Rating', 
        book_id AS 'Book ID', isbn AS 'ISBN', isbn13 AS 'ISBN13'
FROM dbo.books
WHERE best_book_id IN (
    SELECT goodreads_book_id
    FROM meditation_ids
    )
ORDER BY average_rating DESC;

-- =========
-- = ALYCE =
-- =========
/*
Q3. Alyce wants to create a display of books with an average rating of 4.2 or higher, but she only wants books 
that share both title and original title. Write a query that displays both the original title and title for 
Alyce, in descending order by rating. Make sure that none of the original titles contain NULL values either. */

WITH like_titled_ids AS (
    SELECT *
    FROM dbo.books
    WHERE title = original_title
)
SELECT original_title AS 'Original Title', title AS 'Title', average_rating AS 'Avg Rating'
FROM dbo.books
WHERE book_id IN (
    SELECT book_id
    FROM like_titled_ids
    WHERE average_rating >= 4.2
)
ORDER BY average_rating DESC;


-- ==========
-- = THISBE =
-- ==========
/*
Q4. Thisbe is planning to make a long-term display of popular books that she will update monthly, reflecting 
different time periods. She wants to make it reader-centric by including titles that readers have averagely 
rated higher than the book's actual average rating. */

SELECT  b.book_id,
        b.title,
        b.authors,
        (
            SELECT AVG(rating) 
            FROM dbo.ratings AS r
            WHERE b.book_id = r.book_id
            GROUP BY book_id
        ) AS user_avg,
        b.average_rating,
        b.isbn
FROM dbo.books AS b
WHERE average_rating < (
    SELECT AVG(rating) AS user_avg
    FROM dbo.ratings AS r
    WHERE b.book_id = r.book_id
    GROUP BY book_id
)
ORDER BY average_rating DESC;


-- Q4.A. Write a query that compares the publication time with average reader ratings.

SELECT  b.book_id,
        b.title,
        b.authors,
        (
            SELECT AVG(rating) 
            FROM dbo.ratings AS r
            WHERE b.book_id = r.book_id
            GROUP BY book_id
        ) AS user_avg,
        b.original_publication_year,
        b.isbn
FROM dbo.books AS b
WHERE average_rating < (
    SELECT AVG(rating) AS user_avg
    FROM dbo.ratings AS r
    WHERE b.book_id = r.book_id
    GROUP BY book_id
)
ORDER BY original_publication_year DESC, average_rating DESC;


/* SELECT title, 
original_publication_year, 
(
SELECT AVG(r.rating) 
FROM ratings AS r 
WHERE r.book_id = b.book_id
) AS avg_reader_rating, 
average_rating
FROM books b 
WHERE b.book_id IN ( 
    SELECT r.book_id 
    FROM ratings r 
    GROUP BY r.book_id 
    HAVING AVG(r.rating) > b.average_rating) 
ORDER BY original_publication_year DESC, title */

-- Q4.B. She wants the list ordered by year, then the book title.

SELECT  b.book_id,
        b.title,
        b.authors,
        (
            SELECT AVG(rating) 
            FROM dbo.ratings AS r
            WHERE b.book_id = r.book_id
            GROUP BY book_id
        ) AS user_avg,
        b.original_publication_year,
        b.isbn
FROM dbo.books AS b
WHERE average_rating < (
    SELECT AVG(rating) AS user_avg
    FROM dbo.ratings AS r
    WHERE b.book_id = r.book_id
    GROUP BY book_id
)
ORDER BY original_publication_year DESC, title DESC;