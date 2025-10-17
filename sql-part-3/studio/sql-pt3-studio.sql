/* ### Event 1: Women's History Month

Highlight popular women writers based on ratings from `BooksDB` 
by writing a query that returns `tag_id`, the number of times each `tag_id` is 
used and the `tag_name`. Use the `GROUP BY` and `HAVING` clause to narrow your 
focus and try multiple keywords, such as "woman" and "female". */

USE BooksDB
SELECT TOP 25
SUM([count]) AS sum_of_all_usages,
bt.tag_id,
t.tag_name,
b.authors,
b.average_rating
FROM book_tags bt
INNER JOIN tags t ON t.tag_id = bt.tag_id
INNER JOIN books b ON b.book_id = bt.goodreads_book_id
GROUP BY bt.tag_id, t.tag_name, b.authors, b.average_rating
HAVING t.tag_name IN ('author-female', 'woman-author','female-writer', 
'female-writers', 'important-female-authors', 'female-author', 'female-authors',
'woman-trans-agender-authors')
ORDER BY average_rating DESC, sum_of_all_usages DESC



/*  ### Event 2: Choose another event from March/Spring
Write a query to return authors, titles, ratings, and `tag_id` that you would want to 
promote during your chosen event. */


USE BooksDB
SELECT TOP 25
SUM([count]) AS sum_of_all_usages,
bt.tag_id,
t.tag_name,
b.authors,
b.average_rating,
b.title
FROM book_tags bt
INNER JOIN tags t ON t.tag_id = bt.tag_id
INNER JOIN books b ON b.book_id = bt.goodreads_book_id
GROUP BY bt.tag_id, t.tag_name, b.authors, b.average_rating, b.title
HAVING t.tag_name IN ('easter','spring')
ORDER BY average_rating DESC, sum_of_all_usages DESC



/* # Part 2: Choose Another Month

Choose another month and plan at least 2 events / promotions and answer the following questions:
1. Which month did you choose?
2. What 2 events / promotions are you highlighting?*/

-- 1. October
-- 2. Halloween and Indigenous People's Day


/*# Part 3: Summarize your Work

For each event write at least one query that joins any two tables in `BooksDB` to support your 
choice and record you thoughts as to why you used the paticlular query. At least one of your 
queries needs to include a `HAVING` clause. */ 

USE BooksDB
SELECT 
b.title,
b.authors,
b.average_rating,
bt.tag_id,
t.tag_name,
SUM([count]) AS sum_of_all_usages
FROM book_tags bt
INNER JOIN tags AS t ON t.tag_id = bt.tag_id
INNER JOIN books AS b ON b.book_id = bt.goodreads_book_id
GROUP BY bt.tag_id, t.tag_name, b.authors, b.average_rating, b.title
HAVING t.tag_name IN ('halloween','spooky','scary','horror')
ORDER BY average_rating DESC

/*
For Halloween, we chose books tagged with 'Halloween', as well as tags that might be the sort of book somebody might want to read in the spirit of Halloween, 
such as spooky, scary, or horror genre books. The books are sorted by their average rating to highlight those most popular.
*/

USE BooksDB
SELECT
b.title,
b.authors,
b.average_rating,
bt.tag_id,
t.tag_name,
SUM([count]) AS sum_of_all_usages
FROM book_tags bt
INNER JOIN tags t ON t.tag_id = bt.tag_id
INNER JOIN books b ON b.book_id = bt.goodreads_book_id
GROUP BY bt.tag_id, t.tag_name, b.authors, b.average_rating, b.title
HAVING t.tag_name IN ('indigenous', 'indigenous people', 'native american')
ORDER BY average_rating DESC, sum_of_all_usages DESC

/*
For Indigenous People's Day, we tried to select tags that might highlight those stories of indigenous persons. However, some further manual parsing may
be required to weed out any dated and/or problematic offerings. Alternatively, if nationality included 'indigenous' for authors, that would be
another possible way to highlight books for the event.*/