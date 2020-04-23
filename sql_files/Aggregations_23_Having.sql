/*Query 1 - 34*/
SELECT s.name, COUNT(*)
FROM accounts a
JOIN sales_reps s
ON s.id = a.sales_rep_id
GROUP BY s.name
HAVING COUNT(*) > 5;

/*Query 2 - 120*/
SELECT a.name, COUNT(*)
FROM accounts a
JOIN orders o
ON o.account_id = a.id
GROUP BY a.name
HAVING COUNT(*) > 20;

/*Query 3 - Leucadia National - 71*/
SELECT a.name, COUNT(o.occurred_at)
FROM accounts a
JOIN orders o
ON o.account_id = a.id
GROUP BY a.name
ORDER BY COUNT(o.occurred_at) DESC
LIMIT 1;

/*Query 4 - 204*/
SELECT a.name, sum(o.total_amt_usd)
FROM accounts a
JOIN orders o
ON o.account_id = a.id
GROUP BY a.name
HAVING SUM(o.total_amt_usd) > 30000;

/*Query 5 - 3*/
SELECT a.name
FROM accounts a
JOIN orders o
ON o.account_id = a.id
GROUP BY a.name
HAVING SUM(o.total_amt_usd) < 1000;

/*Query 6 - EOG Resources*/
SELECT a.name, SUM(o.total_amt_usd) Total_spent
FROM accounts a
JOIN orders o
ON o.account_id = a.id
GROUP BY a.name
ORDER BY SUM(o.total_amt_usd) DESC
LIMIT 1;

/*Query 7 - Nike*/
SELECT a.name
FROM accounts a
JOIN orders o
ON o.account_id = a.id
GROUP BY a.name
ORDER BY SUM(o.total_amt_usd)
LIMIT 1;

/*Query 8 - 46*/
SELECT a.name
FROM accounts a
JOIN web_events w
ON w.account_id = a.id
WHERE w.channel = 'facebook'
GROUP BY a.name, w.channel
HAVING COUNT(*) > 6

/*Query 9 - Gilead Sciences*/
SELECT a.name
FROM accounts a
JOIN web_events w
ON w.account_id = a.id
WHERE w.channel = 'facebook'
GROUP BY a.name, w.channel
ORDER BY COUNT(*) DESC
LIMIT 1;

/*Query 10 - Direct - Most unique accounts using the direct channel (351)*/
SELECT w.channel, COUNT(DISTINCT a.name)
FROM accounts a
JOIN web_events w
ON w.account_id = a.id
GROUP BY w.channel
ORDER BY COUNT(DISTINCT a.name) DESC;