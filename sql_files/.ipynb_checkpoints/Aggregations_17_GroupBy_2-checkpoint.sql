/*Query 1*/
SELECT a.name, avg(o.standard_qty) Avg_standard, avg(o.gloss_qty) Avg_gloss, avg(o.poster_qty) Avg_poster
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.name;

/*Query 2*/
SELECT a.name, avg(o.standard_amt_usd) Avg_standard_amt, avg(o.gloss_amt_usd) Avg_gloss_amt, avg(o.poster_amt_usd) Avg_poster_amt
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.name;

/*Query 3 - 295*/
SELECT s.name rep_name, w.channel, count(*) AS occurrences
FROM web_events w /*The last granular grouping was the count of channels, so it would be apt to choose the web_events table as the 
from table */
JOIN accounts a
ON a.id = w.account_id
JOIN sales_reps s
ON s.id = a.sales_rep_id
GROUP BY s.name, w.channel
ORDER BY occurrences DESC;

/*Query 4 - 24*/
SELECT r.name region_name, w.channel, count(*) AS occurrences
FROM web_events w
JOIN accounts a
ON a.id = w.account_id
JOIN sales_reps s
ON s.id = a.sales_rep_id
JOIN region r
ON r.id = s.region_id 
GROUP BY r.name, w.channel
ORDER BY occurrences DESC;


