/*
=======================
= SQL Studio - Part 2 =
=======================
*/

USE BooksDB

-- 1. Create a query that returns the longest title in the dataset. We can do this in two steps.
--    A. Create a query that returns the length of the longest title.

SELECT MAX(LEN(title)) AS max_title_char
FROM dbo.books;

--    B. Create a query that uses the length you found in step A to find the longest title.

WITH max_title_length AS (
    SELECT MAX(LEN(title)) AS title_length
    FROM dbo.books)
SELECT *
FROM dbo.books
WHERE LEN(title) = (
    SELECT title_length
    FROM max_title_length);

-- 2. Use what you learned in question 1 to find the shortest author name.  
--    A. Create a query that returns the length of the shortest author.

SELECT MIN(LEN(authors)) AS min_author_length
FROM dbo.books;

--    B. Create a query that returns the shortest author's name.

WITH min_author_length AS (
    SELECT MIN(LEN(authors)) AS author_length
    FROM dbo.books)
SELECT DISTINCT(authors)
FROM dbo.books
WHERE LEN(authors) = (
    SELECT author_length
    FROM min_author_length);

-- 3. How many titles contain the word "The"?  

SELECT COUNT(DISTINCT book_id)
FROM dbo.books
WHERE title LIKE '%The%';


-- 3.a. Is there a difference between the number of titles that use "The" or "the"?

SELECT COUNT(DISTINCT book_id)
FROM dbo.books
WHERE title LIKE '%the%';

-- There is not a difference. This would be dependent on whether or not the database uses case-insensitive collation.
-- In this case, it seems that it does.

-- 4. How many authors' names _start_ with 'Z'?

SELECT COUNT(DISTINCT authors)
FROM dbo.books
WHERE authors LIKE '%Z'
   OR authors LIKE '%, Z%';


-- 5. How many books have been identified as printed in a language other than English? There are four language codes 
--    for English: 'en', 'eng', 'en-US', and 'en-UK'.  Use LEFT to answer the question. (Do not use the wildcard)

SELECT COUNT(DISTINCT book_id)
FROM dbo.books
WHERE LEFT(language_code, 2) <> 'en';

-- You might want to use one of these [comparison operators](https://docs.microsoft.com/en-us/sql/t-sql/language-elements/comparison-operators-transact-sql?view=sql-server-ver15).

-- 6. Retry question 5 using SUBSTRING.

SELECT COUNT(DISTINCT book_id)
FROM dbo.books
WHERE SUBSTRING(language_code, 1, 2) <> 'en';

-- 7. Create a column that returns the title, authors, and language codes. Concatenate these elements so that they return in the following way: title by authors in language_code language.

SELECT 
    title + ' by ' + authors + ' in ' + language_code + ' language' AS concat_book_desc
FROM dbo.books
WHERE language_code IS NOT NULL;

-- A. Check each selected column to see where any values are NULL. Did any of the columns contain NULL values?  If so, which one?

SELECT book_id, title, authors, language_code
FROM dbo.books
WHERE title IS NULL 
   OR authors IS NULL 
   OR language_code IS NULL;

-- 1,084 rows had NULL values for language_code.

-- 8. Update the query in question 7 using COALESCE to change the language code values from NULL to 'unknown'.

SELECT CONCAT(title,' by ',authors,' in ',COALESCE(language_code, 'unknown'),' language') AS book_description
FROM dbo.books;

-- 8.a.  Has this changed the language_code where the values are NULL?

-- Yes. It now reads 'unknown language'.

-- 9. Revisit question 7 using ISNULL instead of COALESCE.

SELECT CONCAT(title,' by ',authors,' in ',ISNULL(language_code, 'unknown'),' language') AS book_description
FROM dbo.books;

-- 9.a.  Has this changed the language_code where the values are NULL?

-- Yes. It also reads 'unknown language'.