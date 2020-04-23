/* Query 1*/
SELECT name, primary_poc, sales_rep_id
FROM accounts
WHERE name in ('Walmart', 'Target', 'Nordstrom');

/*Query 2*/
SELECT *
FROM web_events
WHERE channel in ('organic', 'adwords');