/* Query 1*/
SELECT a.primary_poc, w.channel, w.occurred_at, a.name
FROM web_events w
JOIN accounts a
ON w.account_id = a.id
WHERE a.name = 'Walmart';
/* When alias is used, the table name or column name has to be replaced everywhere within the query */

/* Query 2*/
SELECT s.name rep_name, a.name acc_name, r.name region
FROM sales_reps s
JOIN accounts a
ON s.id = a.sales_rep_id
JOIN region r
ON s.region_id = r.id
ORDER BY a.name;
/*When the names of column match in different tables (which are joined), it is mandatory to rename them for display*/

/* Query 3*/
SELECT (o.total_amt_usd/(o.total + 0.01)) unit_price, a.name acc_name, r.name region
FROM orders o
JOIN accounts a
ON a.id = o.account_id
JOIN sales_reps s
ON s.id = a.sales_rep_id
JOIN region r
ON s.region_id = r.id;
/* 3 tables join one by one*/

