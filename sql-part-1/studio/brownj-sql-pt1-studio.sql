--- SQL Studio - Part 1
--- Brown, Jules

--- *****************************
--- * Part 1: BooksDB Questions *
--- *****************************

-- Question 1: Write a query of the `books` table that returns the top 100 results and includes `book_id`, `authors`, `title`, and `average_rating`. 
--             Use an alias for at least one column and sort the result set in descending order of rating. What is the number one book?

SELECT TOP (100) book_id AS 'Book ID', authors as Author, title AS 'Book Title', average_rating AS 'Avg Rating'
FROM BooksDb.dbo.books
ORDER BY average_rating DESC
-- Number one book is The Complete Calvin and Hobbes by Bill Watterson (book_id 24812).

-- Question 2: Write a query to find the least popular book.

SELECT TOP (1) book_id AS 'Book ID', authors as Author, title AS 'Book Title', average_rating AS 'Avg Rating'
FROM BooksDB.dbo.books
GROUP BY book_id, authors, title, average_rating
ORDER BY average_rating ASC
-- The least popular book is One Night at the Call Center by Chetan Bhagat (book_id 105578).

-- Question 3: Which tag is the most popular? / Question 4: What is the name of the most popular tag?

SELECT *
FROM BooksDB.dbo.tags
WHERE tag_id = (
    SELECT TOP (1) tag_id
    FROM BooksDB.dbo.book_tags
    ORDER BY "count" DESC)
-- Tag ID 30574 for 'to-read' is the most popular.

-- Question 5: How many books where released in the first decade of 2000?
SELECT COUNT(DISTINCT book_id) AS "Books Released 2000-2010"
FROM BooksDB.dbo.books
WHERE (original_publication_year >= 2000) AND (original_publication_year < 2011)
-- 3,594 books were released in the first decade of 2000's

-- Question 6: How many book titles contain the word, "happy"?
SELECT COUNT(DISTINCT book_id) AS "Books with Titles Containing 'Happy'"
FROM BooksDB.dbo.books
WHERE title LIKE '%happy%'
-- 13 books have titles containing the word 'happy'

-- Question 7: List the books from the top 3 authors from Question 1.  
--             If there is more than one author just use the first one. Sort the title alphabetically by `author` and then by `average_rating`, 
--             best rated to lowest. Does this order matter in sorting?

SELECT book_id AS 'Book ID', authors as Author, title AS 'Book Title', average_rating AS 'Avg Rating'
FROM BooksDB.dbo.books
WHERE authors IN
    (SELECT TOP (3) authors
    FROM BooksDB.dbo.books
    ORDER BY average_rating DESC)
ORDER BY authors DESC, average_rating DESC

-- Below is hard-coded for the authors.
SELECT book_id AS 'Book ID', authors as Author, title AS 'Book Title', average_rating AS 'Avg Rating'
FROM BooksDB.dbo.books
WHERE 
    (authors = 'Bill Watterson'  
    OR authors = 'Brandon Sanderson' 
    OR authors LIKE 'J.K. Rowling%')
ORDER BY authors DESC, average_rating DESC

-- Question 8: Write a query that returns the number of authors whose first name is between rock and roll.
SELECT COUNT(authors)
FROM BooksDB.dbo.books
WHERE authors < 'roll' AND authors >= 'rock';

--- ***************************
--- * Part 2: Jules'Questions *
--- ***************************

-- Question 1: 


-- Question 2:  