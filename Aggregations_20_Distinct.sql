/*Query 1*/

/*
1. Even without distinct the number of row entries is same which implies there are no accounts associated with more than one region. 
2. Check the list of accounts separately to verify the number
*/

SELECT distinct a.name, r.name as reg_name
FROM accounts a
JOIN sales_reps s
ON s.id = a.sales_rep_id
JOIN region r
ON r.id = s.region_id;


/*Query 2*/
SELECT s.name, COUNT(*) no_accounts
FROM accounts a
JOIN sales_reps s
ON s.id = a.sales_rep_id
GROUP BY s.name
ORDER BY no_accounts;

SELECT DISTINCT s.id, s.name
FROM sales_reps s;