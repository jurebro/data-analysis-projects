-- ==============================
-- = EXERCISES: COMPLEX QUERIES =
-- ==============================

/* For the exercises, you are tasked with writing five queries that will help you delve deeper into BooksDB. You can choose whether you want to use a 
correlated subquery, a nested subquery, the UNION operator, the INTERSECT operator, or the EXCEPT operator for each one. You may not use joins or add 
multiple statements to the WHERE clause.*/

/* 1. Write a query that will return the number of users who rated a book above it's average rating. */ 

USE BooksDB
SELECT COUNT(*)
FROM dbo.ratings AS r
WHERE r.rating > (
    SELECT b.average_rating
    FROM dbo.books AS b
    WHERE b.book_id = r.book_id
);

/* 2. Write a query that returns the book ids of all books that have over 1000 ratings of 1 star or over 1000 ratings of 5 stars. */

SELECT book_id
FROM dbo.books
WHERE ratings_1 > 1000 

UNION

SELECT book_id
FROM dbo.books
WHERE ratings_5 > 1000;

/* 3. Write a query that returns the book ids of all books that have over 1000 ratings of 1 star and over 1000 ratings of 5 stars. */

SELECT book_id
FROM dbo.books
WHERE ratings_1 > 1000 

INTERSECT

SELECT book_id
FROM dbo.books
WHERE ratings_5 > 1000;


/* 4. Write a query that returns the book ids of books that have a language code of "en-US" and not a langugae code of "en-GB". */

SELECT DISTINCT book_id
FROM dbo.books
WHERE language_code = 'en-US'

INTERSECT

SELECT DISTINCT book_id
FROM dbo.books
WHERE NOT language_code = 'en-GB';

/* 5. Write a query that returns the names of the tags and the tag ids for tags that were used over 100,000 times for a book.  */

SELECT tag_id, tag_name
FROM dbo.tags
WHERE tag_id IN (
    SELECT DISTINCT tag_id
    FROM dbo.book_tags
    WHERE count > 100000
);