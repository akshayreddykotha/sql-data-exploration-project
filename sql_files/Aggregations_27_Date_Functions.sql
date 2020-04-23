/*Query 1 - Sales rose from 2013-16 and there was a sudden dip in 2017*/
SELECT DATE_PART('year', occurred_at) AS Year, sum(total_amt_usd) sales_in_that_year
FROM orders
GROUP BY 1
ORDER BY 2 DESC;

/*Query 2 - December it is. X All months are evenly represented in the dataset X. 2013 and 2017 have only one month of sales data*/
SELECT DATE_PART('month', occurred_at) AS Month, sum(total_amt_usd) sales_in_that_month
FROM orders
GROUP BY 1
ORDER BY 2 DESC;

	
/*Query 3 - 2016. All the orders are not evenly represented as the numbers are of different orders of magnitude*/
SELECT DATE_PART('year', occurred_at) AS year, count(*) orders_in_that_year
FROM orders
GROUP BY 1
ORDER BY 2 DESC;

/*Query 4 - December. All the orders in different months are evenly represented*/
SELECT DATE_PART('month', occurred_at) AS month, count(*) orders_in_that_month
FROM orders
GROUP BY 1
ORDER BY 2 DESC;

/*Query 5 - 2016 - May*/
SELECT DATE_TRUNC('month', o.occurred_at) AS month, sum(o.gloss_amt_usd) amt_spent_gloss_walmart
FROM orders o
JOIN accounts a
ON a.id = o.account_id
WHERE a.name = 'Walmart'
GROUP BY 1
ORDER BY 2 DESC;