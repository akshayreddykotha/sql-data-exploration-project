/*UNION aLL appends all data rows from the two tables inspite of repeated entries */
/* Query 1*/
SELECT *
FROM accounts a1

UNION ALL

SELECT *
FROM accounts a2;

/*Query 2*/
SELECT *
FROM accounts a1
WHERE name = 'Walmart'

UNION 

SELECT *
FROM accounts a2
WHERE name = 'Disney';

/*Query 3*/
/*Performing operations on the combined dataset*/
WITH double_accounts AS 
(SELECT *
FROM accounts a1

UNION ALL

SELECT *
FROM accounts a2)

SELECT name, COUNT(*)
FROM double_accounts
GROUP BY 1
ORDER BY 2 DESC;