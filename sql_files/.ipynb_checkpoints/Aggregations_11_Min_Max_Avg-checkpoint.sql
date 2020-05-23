/* Query 1 *
By date the question didn't mean the substring within the each cell*/
SELECT MIN(occurred_at) 
FROM orders;

/* Query 2*/
SELECT occurred_at
FROM orders
ORDER BY occurred_at
LIMIT 1;

/* Query 3*/
SELECT MAX(occurred_at)
FROM web_events;


/* Query 4*/
SELECT occurred_at
FROM web_events
ORDER BY occurred_at DESC
LIMIT 1;

/* Query 5 - Sum and count were used to avoid NULL values within the columns in the numerator and denominator of the average/mean calculation*/
SELECT avg(standard_amt_usd) AS standard_avg_sales, 
	   avg(gloss_amt_usd) AS gloss_avg_sales, 
       avg(poster_amt_usd) AS poster_avg_sales,   
       sum(standard_qty)/count(standard_qty) AS standard_avg_qty,
       sum(gloss_qty)/count(gloss_qty) AS gloss_avg_qty,
       sum(poster_qty)/count(poster_qty) AS poster_avg_qty
FROM orders;

/*Query 6 - Even number of entries - Median calculation is avg. of the middle two 

1. This is a third way of median calculation I observed
2. All the ways I observed had creation of derived tables */
SELECT *
FROM (SELECT total_amt_usd
      FROM orders
      ORDER BY total_amt_usd
      LIMIT 3457) AS Table1
ORDER BY total_amt_usd DESC
LIMIT 2;

/*alternate when there are odd number of entries*/

SELECT o.total_amt_usd AS median_total_usd
FROM orders o
WHERE (SELECT count(total_amt_usd) 
       from orders
       where total_amt_usd < o.total_amt_usd) = 
       (SELECT count(total_amt_usd) 
       from orders
       where total_amt_usd > o.total_amt_usd);

