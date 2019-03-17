/* Query 1 - Sometimes ORDER BY is sufficient. There will be no need of GROUP BY*/
SELECT  a.name, o.occurred_at
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.name, o.occurred_at /*redundant GROUP BY*/
ORDER BY o.occurred_at
LIMIT 1;

/*Query 2*/
SELECT  a.name, sum(o.total_amt_usd) AS Total_Sales
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.name;

/* QUery 3*/
SELECT  w.occurred_at, w.channel, a.name
FROM web_events w
JOIN accounts a
ON a.id = w.account_id
GROUP BY w.channel, a.name, w.occurred_at /* redundant*/
ORDER BY w.occurred_at DESC
LIMIT 1;

/*Query 4*/
SELECT  channel, count(*) AS no_of_times_channel_used
FROM web_events
GROUP BY channel;

/*Query 5*/
SELECT  a.primary_poc
FROM web_events w
JOIN accounts a
ON a.id = w.account_id
GROUP BY a.primary_poc, w.occurred_at /* No need of grouping by primary_poc. Time of occurrence is the conditional entity here.*/
ORDER BY w.occurred_at
LIMIT 1;

/*Query 6 - More granular*/
SELECT  a.name, min(o.total_amt_usd) small_order
FROM orders o
JOIN accounts a
ON a.id = o.account_id
GROUP BY a.name
ORDER BY small_order;

/*Query 7*/
SELECT  r.name as region_name, count(*) AS no_salesreps
FROM sales_reps s
JOIN region r
ON r.id = s.region_id
GROUP BY r.name
ORDER BY no_salesreps;