Parch and Posey database was used to explore different functional aspects of SQL from basic to advanced.

This short project is to help anyone to setup their own local environment and practice querying. 

## Setting up the environment:
### Database used: 
Parch and Posey, a hypothetical paper company's sales data of different types of paper (gloss, standard). The database consists of different [tables](https://github.com/akshayreddykotha/sql-data-exploration-project/tree/master/data) linked with a database schema. If you want to create a database from scratch, you can use these excel files and set it up.

### Alternate way to have the database set up locally:
Gathered the [database dump](https://github.com/akshayreddykotha/sql-data-exploration-project/blob/master/parch_and_posey_db_archivedump) file from [a fellow github user](https://github.com/ayushi-b). The database dump was created using `pg_dump` and it is an archive unlike a database dump file with an sql extension. For difference between both, refer to this [question](https://stackoverflow.com/questions/2732474/restore-a-postgres-backup-file-using-the-command-line).

### Load database dump in windows:

1. Install [PostgreSQL](https://www.enterprisedb.com/downloads/postgres-postgresql-downloads) on your desktop
2. Open pgAdmin app, login with the password set during installation of PostgreSQL for desktop
3. Create a database by clicking on the Databases (open the tree starting from `Server`)
4. After creating database, click the database name, go to `Objects` dropdown, you should see `Restore` option
5. Using `Restore` option, choose thedump file you downloaded, the `parch_and_posey_db_archivedump` file and restore it.
6. You should see the different tables within the database under `Tables` within the tree structure under the database you created

**An alternate way**:
1. Run this `pg_restore --create --dbname=postgres --username=postgres parch_and_posey_db_archivedump`. You do not need to create a new database prior to loading this database. This command loads the database into a new database named *Parch & Posey Database*.
2. On running this command, you might be asked a password which you might have set during installation of PostgreSQL on your machine.
3. Creation of database prior to load/restore isn't preferred to avoid conflicts.

Now open the pgAdmin4 and connect to server and database. You are now open to querying the database via the query tool within this GUI.

## Practice Querying - The Ulterior Motive for setting up the environment:
Below are some sample queries relevant. Practice them and play with them to learn more.
### Basic
#### LIKE
1. '%C' and '%c' would give the same result as using LIKE is case-insensitive.
2. If the results should contain characters at a specific position, use `_t%`. For instance, this gives all the entries with `t` as the second character.

Use the accounts table to find
1. All the companies whose names start with 'C'. 
2. All companies whose names contain the string 'one' somewhere in the name.
3. All companies whose names end with 's'.

Check your queries using this file [matching-IN-LIKE.ipynb](https://github.com/akshayreddykotha/sql-data-exploration-project/blob/master/matching-IN-LIKE.ipynb). LIKE is used with wild cards.
#### IN
1. Use the accounts table to find the account name, primary_poc, and sales_rep_id for Walmart, Target, and Nordstrom.
2. Use the web_events table to find all information regarding individuals who were contacted via the channel of organic or adwords.

Check your queries using this file [matching-IN-LIKE.ipynb](https://github.com/akshayreddykotha/sql-data-exploration-project/blob/master/matching-IN-LIKE.ipynb). IN is used to filter data for more than one element of a particular field/ column.

#### INTO
To save the outcome into a table - Ex: `SELECT x, y, z INTO table FROM ...`

### Joins

#### Definitions

1. A **semi-join** returns the rows of the first table where it can find a match in the second table.
2. A **cross-join** returns the cartesian product (number of rows) of the number of rows of the tables involved.

*Trivia*:
1. JOIN keywords works for INNER JOIN. It is the default join in SQL.
2. CROSS JOIN used with a WHERE clause similar to the ON condition in INNER JOIN will give out the same results as an INNER JOIN.
3. CROSS JOIN is an expensive statement that can lead to data explosion so it needs to be used carefully, preferably as an alternative for an INNER JOIN. For different ways of writing a CROSS JOIN query, refer [JOINS.ipynb](https://github.com/akshayreddykotha/sql-data-exploration-project/blob/master/JOINS.ipynb).

#### Questions

1. Provide a table for all web_events associated with account name of Walmart. There should be three columns. Be sure to include the primary_poc, time of the event, and the channel for each event. Additionally, you might choose to add a fourth column to assure only Walmart events were chosen. 

2. Provide a table that provides the region for each sales_rep along with their associated accounts. Your final table should include three columns: the region name, the sales rep name, and the account name. Sort the accounts alphabetically (A-Z) according to account name. 

3. Provide the name for each region for every order, as well as the account name and the unit price they paid (total_amt_usd/total) for the order. Your final table should have 3 columns: region name, account name, and unit price. A few accounts have 0 for total, so I divided by (total + 0.01) to assure not dividing by zero.

Check your queries using this file [JOINS.ipynb](https://github.com/akshayreddykotha/sql-data-exploration-project/blob/master/JOINS.ipynb). 

### Aggregations
#### DISTINCT
1. Use DISTINCT to test if there are any accounts associated with more than one region.
2. Have any sales reps worked on more than one account?

Check your queries and output using this file [aggregations-DISTINCT.ipynb](https://github.com/akshayreddykotha/sql-data-exploration-project/blob/master/aggregations-DISTINCT.ipynb)

#### HAVING
1. How many of the sales reps have more than 5 accounts that they manage?
2. How many accounts have more than 20 orders?
3. Which account has the most orders?
4. Which accounts spent more than 30,000 usd total across all orders?
5. Which accounts spent less than 1,000 usd total across all orders?
6. Which account has spent the most with us?
7. Which account has spent the least with us?
8. Which accounts used facebook as a channel to contact customers more than 6 times?
9. Which account used facebook most as a channel? 
10. Which channel was most frequently used by most accounts?

*Trivia*:
1. ORDER BY can have the new variable name used
2. HAVING doesn't allow variable name rather it allows aggregation function with condition.
3. HAVING works only where there is an aggregation column (Ex: SUM(orders)...HAVING orders  > 999) in the table/view built.

Check your queries and output using this file [aggregations-HAVING.ipynb](https://github.com/akshayreddykotha/sql-data-exploration-project/blob/master/aggregations-HAVING.ipynb).

### Window Functions
#### ROW_NUMBER & RANK
1. Ranking Total Paper Ordered by Account: Select the id, account_id, and total variable from the orders table, then create a column called total_rank that ranks this total amount of paper ordered (from highest to lowest) for each account using a partition. Your final table should have these four columns.

Check your query and output using this file [windowfunctions-RANK.ipynb](https://github.com/akshayreddykotha/sql-data-exploration-project/blob/master/windowfunctions-RANK.ipynb)

*Trivia*:
1. Within OVER() ORDER BY clause runs first and then runs Partition BY clause. 
2. RANK works with the concept of [Standard Competition Ranking](https://en.wikipedia.org/wiki/Ranking#Standard_competition_ranking_(%221224%22_ranking)) which skips the rank if same ranks are allocated. DENSE_RANK assigns same ranks but doesn't skip the rank. 

### Advanced Joins & Performance Tuning
#### UNION
1. Write a query that uses UNION ALL on two instances (and selecting all columns) of the accounts table.
2. Add a WHERE clause to each of the tables that you unioned in the query above, filtering the first table where name equals Walmart and filtering the second table where name equals Disney. 
3. Perform the union in your first query (under the Appending Data via UNION header) in a common table expression and name it double_accounts. Then do a COUNT the number of times a name appears in the double_accounts table. If you do this correctly, your query results should have a count of 2 for each name.

Check your queries using this file [advanced-JOINS.ipynb](https://github.com/akshayreddykotha/sql-data-exploration-project/blob/master/advanced-JOINS.ipynb).

*Trivia*:
1. When filtering out tables with multiple conditions using OR, having separate table filters and using UNION runs faster than just using a WHERE ... OR ... piece of code.

### Subqueries
These are an integral part of queries in SQL without which complex queries don't exist.

#### Correlated or synchronized subqueries
1. Uses the same table within the inner and outer query. The outer query is where the records are accessed from and the inner query is used to filter values based on a correlated column (same in the two table aliases).
2. This is a great alternative for window functions to return the `first` or `last` entries within a group.

*Trivia*:
1. Most commonly used in WHERE, then SELECT and FROM.
2. Sometimes subqueries are also seen within ON while joining two tables.

### Functional programming (MS SQL Server)

1. Variable declaration: `DECLARE @var INT = 2` and others, check documentation
2. WHILE (@var ... condition)
3. IF ELSE, just like python. Both IF ELSE and WHILE loops have the `BEGIN` and `END` clause within
4. `SET` to assign a value to the variable
5. BREAK

### Arithmetic functions - Not so common

#### ROUND
1. To round values to the desired number of decimal places.
2. Ex: ROUND((current - previous) :: NUMERIC/previous, 2). Adding **NUMERIC** is important without there will be an error (run-time).

#### PERCENTILE
1. A `30 percentile` in column_b by using PERCENTILE_CONT(0.30) WITHIN GROUP (ORDER BY column_b ASC) (usage of window function)

#### LENGTH
1. Can be used to calculate the length of string in any cell in the table. It goes by LENGTH(city) for instance.

### Miscellaneous

#### INTERSECT
1. `select index from table1 INTERSECT select index from table2`
2. Number of columns on which intersect is applied has to match between the tables. If not selected, by default, first column is chosen.

#### LIMIT OFFSET
1. LIMIT 5 OFFSET 5 returns the entries by excluding the first 5 entries and still limiting the final output to 5 entries. If the entries are identified using 1, 2, ..., then the entries with id - 6 to 10 are returned.

#### RIGHT and LEFT
1. RIGHT(name, 3) extracts the last the letters of the column name.
2. LEFT(name, 2) extracts the first two letter of the column name.

#### DATE_TRUNC
1. To get the specific 'week', 'month' from the date - `DATE_TRUNC('week', Date)`

#### EXTRACT
1. Works similar to DATE_TRUNC with an added keyword `FROM` - `EXTRACT('month' FROM Date)` gives you the month

#### CTE - Common Table Expression 
1. Use `WITH table1 AS (query)` to save a table created from raw table. `table1` can be used for further calculations.
2. CTEs are useful in cleaner modularized code.
3. When two or more tables are defined with CTE, the use of `WITH table1 AS` is sufficient at the start and from the second table, a comma followed by `AS table2 (...)` works after each additional CTE defined.

#### COALESCE
1. To set a NULL value to a desired value.
2. Ex: COALESCE(`base command (generally LAG)`, 0)

#### INTERVAL
1. INTERVAL '1 month'

#### TO_CHAR
1. To convert dates to an easily readable format. `TO_CHAR(date, 'DD')` gives the day number for instance.
2. `FMDay DD, FMMonth YYYY` is the format which converts the YYYY-MM-DD into a fully readable data.

#### PIVOTING
1. PIVOTING is the core tool which allows reshaping tables.
2. CROSSTAB($$ $$) allows pivoting which is converting a long table to wide table.
3. `$$ $$` within the CROSSTAB converts the table to string before converting it to a CROSSTAB
4. An extension has to be imported, just like importing a library in python/R which is done by `CREATE EXTENSION IF NOT EXISTS tablefunc` which is a library which isn't present in the default environment.

### MSSQl Server

1. DECLARE, SET, WHILE, @var, BEGIN, END, PRINT, REPLICATE

New queries are always welcome :). Ping to collaborate and contribute.

Thanks to [Derek](https://www.linkedin.com/in/dereksteer/) from [MODE Analytics](https://modeanalytics.com) for hosting such a concept-wise outline of what all an SQL aspirant needs to know and learn about. Cheers to [Udacity](https://classroom.udacity.com)!
