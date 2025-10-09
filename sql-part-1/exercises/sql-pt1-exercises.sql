--- SQL Exercises - Part 1
--- Brown, Jules

--- **********************
--- * A: The Books Table *
--- **********************

--- Question 1: Select the [top 1000 rows] from the books table.  Make sure you are able to see all of the columns.
USE BooksDB
SELECT TOP 1000 *
FROM dbo.books;

--- Question 2: Count the number of titles.  Are there 10,000 titles as promised by the dataset?
SELECT COUNT(DISTINCT book_id)
FROM dbo.books;
---- Yes. There are 10,000 titles as promised.

--- Question 3: Count the number of books where the `original_publication_year` is earlier than 1800.
SELECT COUNT(DISTINCT book_id)
FROM dbo.books
WHERE original_publication_year < 1800;

--- Question 4: Create a query that displays distinct authors from the table.
SELECT DISTINCT authors
FROM dbo.books;

--- Question 5: Create a query that displays a count of all the books that contain a language code for English.  This could be represented in the table as \"eng\" or \"en-\".
SELECT COUNT(DISTINCT book_id)
FROM dbo.books
WHERE (language_code = 'eng') OR (language_code = 'en-');

--- **************************
--- * B: The Book Tags Table *
--- **************************

--- Question 1: Select the top 1000 table items ordered by the `tag_id`.
SELECT TOP 1000 *
FROM dbo.tags
ORDER BY tag_id DESC;

--- Question 2: Create a query that counts the number of `goodreads_book_id` grouped by the `tag_id`.
SELECT COUNT(DISTINCT goodreads_book_id)
FROM dbo.book_tags
GROUP BY tag_id;

--- Question 3: In the last query, we created a new, unnamed column.  Use `AS` to create an alias to provide a name of your choice to this new column.
SELECT count AS 'tag_id_count'
FROM dbo.book_tags;

--- **************************
--- * C: The Ratings Table *
--- **************************

--- Question 1: Create a query that displays the top 1000 items in the table in descending order.
SELECT TOP 1000 *
FROM dbo.ratings
ORDER BY rating DESC;

--- Question 2: Create a query that returns the total number of users that have given a rating of less than 2.
SELECT COUNT(DISTINCT user_id) AS users_low_rating
FROM ratings
WHERE rating < 2;

--- Question 3: Create a query that returns the sum of books that have a rating of 4 or higher.
SELECT COUNT(DISTINCT book_id) AS books_high_rating
FROM dbo.books
WHERE average_rating >= 4;


--- **************************
--- * D: The Tags Table *
--- **************************

--- Question 1: Create a query that returns table items where the `tag_name` describes the book as a mystery.
SELECT *
FROM dbo.book_tags
WHERE tag_id IN (
    SELECT tag_id
    FROM dbo.tags
    WHERE tag_name LIKE '%mystery%');

--- Question 2: Run the query below. In your own words, what is it returning?
--      SELECT *
          -- FROM BooksDB.dbo.tags
          -- WHERE tag_name < 'd' AND tag_name >= 'c';
--   
-- The query is identifying all tags in the dbo.tags table where the tag_name begins with the letter 'c'.