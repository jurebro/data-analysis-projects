/* # Exercises: Creating, Updating, and Destroying Objects

For the exercises, you will be working with objects and data you create. Before opening this notebook, make sure that you have set up the 
new connection to the server and that you have located the database and your schema.

## Object Creation

Before coding, think of three things you want to make. These could be coding projects, new recipes, or planned projects for a woodworking hobby. 
Brainstorm the appropriate column names and data types as well. */

-- Create a table under your schema called `planned_makes`.

USE Sep2025JunkDB
CREATE TABLE jules_brown.planned_makes(
   name VARCHAR(25),      
   description VARCHAR(50),      
   instructions VARCHAR(500),
);

-- Add three rows to your table that are your planned makes.

INSERT INTO jules_brown.planned_makes (name, description, instructions)
    VALUES('Apartment', 'Moving', 'Search for 2bd1+ba apartments in KS'),
    VALUES('House', 'Selling', 'Follow realtor checklist'),
    VALUES('House', 'Moving', 'Buy more banker boxes');


/* ## Update a Row */

-- Change different values in one of your three rows.
UPDATE jules_brown.planned_makes
SET Instructions = 'Buy more packing materials, incl tape'
WHERE name = 'House' AND description = 'Moving';

/* ## Delete a Row */

-- Delete one of the rows from your table.

DELETE FROM jules_brown.planned_makes 
WHERE name = 'Apartment';

/* ## Drop the Table */

-- While this has been fun, it is time to drop the table!

DROP TABLE jules_brown.planned_makes