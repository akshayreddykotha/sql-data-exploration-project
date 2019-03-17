/* Query 1 - 48*/
SELECT s.name rep_name, a.name acc_name, r.name region
FROM sales_reps s
JOIN accounts a
ON s.id = a.sales_rep_id
JOIN region r
ON s.region_id = r.id
WHERE r.name = 'Midwest'
ORDER BY a.name;

/* Query 2 - 5 */
SELECT s.name rep_name, a.name acc_name, r.name region
FROM sales_reps s
JOIN accounts a
ON s.id = a.sales_rep_id
JOIN region r
ON s.region_id = r.id
WHERE s.name LIKE 'S%'AND r.name = 'Midwest'
ORDER BY a.name;

/* Query 3 */
SELECT s.name rep_name, a.name acc_name, r.name region
FROM sales_reps s
JOIN accounts a
ON s.id = a.sales_rep_id
JOIN region r
ON s.region_id = r.id
WHERE s.name LIKE '% K%'AND r.name = 'Midwest'
ORDER BY a.name;

/*Query 4 - 4509*/ 
SELECT (o.total_amt_usd/(o.total + 0.01)) unit_price, a.name acc_name, r.name region
FROM orders o
JOIN accounts a
ON a.id = o.account_id
JOIN sales_reps s
ON s.id = a.sales_rep_id
JOIN region r
ON s.region_id = r.id
WHERE o.standard_qty > 100;

/*Query 5 - 835*/ 
SELECT (o.total_amt_usd/(o.total + 0.01)) unit_price, a.name acc_name, r.name region
FROM orders o
JOIN accounts a
ON a.id = o.account_id
JOIN sales_reps s
ON s.id = a.sales_rep_id
JOIN region r
ON s.region_id = r.id
WHERE o.standard_qty > 100 AND o.poster_qty > 50
ORDER BY unit_price;

/*Query 6 - 835 descending*/ 
SELECT (o.total_amt_usd/(o.total + 0.01)) unit_price, a.name acc_name, r.name region
FROM orders o
JOIN accounts a
ON a.id = o.account_id
JOIN sales_reps s
ON s.id = a.sales_rep_id
JOIN region r
ON s.region_id = r.id
WHERE o.standard_qty > 100 AND o.poster_qty > 50
ORDER BY unit_price DESC;

/*Query 7 - 6 */ 
SELECT DISTINCT w.channel, a.name
FROM web_events w
JOIN accounts a
ON w.account_id = a.id
WHERE a.id = 1001;

/*Query 8 - 1725*/ 
SELECT o.occurred_at, a.name, o.total, o.total_amt_usd
FROM orders o
JOIN accounts a
ON o.account_id = a.id
WHERE o.occurred_at BETWEEN '2015-1-1' AND '2016-1-1'
ORDER BY o.occurred_at;
