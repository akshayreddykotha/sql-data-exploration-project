# SQL data exploration project
Parch and Posey database was used to explore different functional aspects of SQL from basic to advanced.

This short project is to help anyone to setup their own local environment and practice querying. 

## Setting up the environment:
### Database used: 
Parch and Posey, a hypothetical paper company's sales data of different types of paper (gloss, standard). The database consists of different [tables](https://github.com/akshayreddykotha/sql-data-exploration-project/tree/master/data) linked with a database schema. If you want to create a database from scratch, you can use these excel files and set it up.

### Alternate way to have the database set up locally:
Gathered the [database dump](https://github.com/akshayreddykotha/sql-data-exploration-project/blob/master/parch_and_posey_db_archivedump) file from [Ayushi](https://github.com/ayushi-b). The database dump was created using `pg_dump` and it is an archive unlike a database dump file with an sql extension. For difference between both, refer to this [question](https://stackoverflow.com/questions/2732474/restore-a-postgres-backup-file-using-the-command-line).

### Load database dump in windows:

1. Install [PostgreSQL](https://www.enterprisedb.com/downloads/postgres-postgresql-downloads) on your desktop
2. Open windows CMD
3. Go to the folder where you downloaded the `parch_and_posey_db_archivedump` file.
4. Run this `pg_restore --create --dbname=postgres --username=postgres parch_and_posey_db_archivedump`. You do not need to create a new database prior to loading this database. This command loads the database into a new database named *Parch & Posey Database*.
5. On running this command, you might be asked a password which you might have set during installation of PostgreSQL on your machine.
6. Creation of database prior to load/restore isn't preferred to avoid conflicts.

Now open the pgAdmin4 and connect to server and database. You are now open to querying the database via the query tool within this GUI.

## Practice Querying - The Ulterior Motive for setting up the environment:
Below are some sample queries relevant. Practice them and play with them to learn more.
### Basic
#### LIKE
Use the accounts table to find
1. All the companies whose names start with 'C'. 
2. All companies whose names contain the string 'one' somewhere in the name.
3. All companies whose names end with 's'.

Check your queries using this file [Basic_35_Like.sql](https://github.com/akshayreddykotha/sql-data-exploration-project/blob/master/Basic_35_Like.sql). LIKE is used with wild cards.
#### IN
1. Use the accounts table to find the account name, primary_poc, and sales_rep_id for Walmart, Target, and Nordstrom.
2. Use the web_events table to find all information regarding individuals who were contacted via the channel of organic or adwords.

Check your queries using this file [Basic_38_In.sql](https://github.com/akshayreddykotha/sql-data-exploration-project/blob/master/Basic_38_In.sql). IN is used to filter data for more than one element of a particular field/ column.
### Joins

#### Semi-Join

A semi join returns the rows of the first table where it can find a match in the second table.

1. Provide a table for all web_events associated with account name of Walmart. There should be three columns. Be sure to include the primary_poc, time of the event, and the channel for each event. Additionally, you might choose to add a fourth column to assure only Walmart events were chosen. 

2. Provide a table that provides the region for each sales_rep along with their associated accounts. Your final table should include three columns: the region name, the sales rep name, and the account name. Sort the accounts alphabetically (A-Z) according to account name. 

3. Provide the name for each region for every order, as well as the account name and the unit price they paid (total_amt_usd/total) for the order. Your final table should have 3 columns: region name, account name, and unit price. A few accounts have 0 for total, so I divided by (total + 0.01) to assure not dividing by zero.

Check your queries using this file [Joins_11_part_1.sql](https://github.com/akshayreddykotha/sql-data-exploration-project/blob/master/Joins_11_part_1.sql). 
### Aggregations
#### DISTINCT
1. Use DISTINCT to test if there are any accounts associated with more than one region.
2. Have any sales reps worked on more than one account?

Check your queries using this file [Aggregations_20_Distinct.sql](https://github.com/akshayreddykotha/sql-data-exploration-project/blob/master/Aggregations_20_Distinct.sql).
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
2. HAVING BY doesn't allow variable name rather it allows aggregation function with condition.


Check your queries using this file [Aggregations_23_Having.sql](https://github.com/akshayreddykotha/sql-data-exploration-project/blob/master/Aggregations_23_Having.sql).

### Window Functions
#### ROW_NUMBER & RANK
1. Ranking Total Paper Ordered by Account: Select the id, account_id, and total variable from the orders table, then create a column called total_rank that ranks this total amount of paper ordered (from highest to lowest) for each account using a partition. Your final table should have these four columns.

Check your query using this file [WindowFunctions_8_RowNumbe,Rank.sql](https://github.com/akshayreddykotha/sql-data-exploration-project/blob/master/WindowFunctions_8_RowNumber%2CRank.sql)

*Trivia*:
1. Within OVER() ORDER BY clause runs first and then runs Partition BY clause. 
2. RANK works with the concept of [Standard Competition Ranking](https://en.wikipedia.org/wiki/Ranking#Standard_competition_ranking_(%221224%22_ranking)) which skips the rank if same ranks are allocated. DENSE_RANK assigns same ranks but doesn't skip the rank. 

### Advanced Joins & Performance Tuning
#### UNION
1. Write a query that uses UNION ALL on two instances (and selecting all columns) of the accounts table.
2. Add a WHERE clause to each of the tables that you unioned in the query above, filtering the first table where name equals Walmart and filtering the second table where name equals Disney. 
3. Perform the union in your first query (under the Appending Data via UNION header) in a common table expression and name it double_accounts. Then do a COUNT the number of times a name appears in the double_accounts table. If you do this correctly, your query results should have a count of 2 for each name.

Check your queries using this file [AdvancedJoins_PerformanceTuning_12_Union.sql](https://github.com/akshayreddykotha/sql-data-exploration-project/blob/master/AdvancedJoins_PerformanceTuning_12_Union.sql).

### Subqueries
These are an integral part of queries in SQL without which complex queries don't exist.

*Trivia*:
1. Most commonly used in WHERE, then SELECT and FROM.
2. Sometimes subqueries are also seen within ON while joining two tables.

New queries are always welcome :). Ping to collaborate and contribute.

Thanks to [Derek](https://www.linkedin.com/in/dereksteer/) from [MODE Analytics](https://modeanalytics.com) for hosting such a concept-wise outline of what all an SQL aspirant needs to know and learn about. Cheers to [Udacity](https://classroom.udacity.com)!
