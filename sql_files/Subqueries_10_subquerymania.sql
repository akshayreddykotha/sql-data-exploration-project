/* Query 1 - Region wise top sales performers (sales_reps)*/
SELECT t3.region_name, t3.rep_name
FROM (SELECT r.name region_name,s.name rep_name,  SUM(o.total_amt_usd) Sales_made
	  FROM orders o 
	  JOIN accounts a
	  ON a.id = o.account_id
	  JOIN sales_reps s
	  ON s.id = a.sales_rep_id
	  JOIN region r
	  ON r.id = s.region_id
	  GROUP BY r.name,s.name) t3
JOIN (SELECT t1.region_name, Max(t1.Sales_made) Max_sales
	  FROM (SELECT r.name region_name,s.name rep_name,  SUM(o.total_amt_usd) Sales_made
				  FROM orders o 
				  JOIN accounts a
	              ON a.id = o.account_id
	              JOIN sales_reps s
	              ON s.id = a.sales_rep_id
	              JOIN region r
				  ON r.id = s.region_id
				  GROUP BY r.name,s.name) t1
			GROUP BY t1.region_name) t2
ON t3.Sales_made = t2.Max_sales;

/*QUery 2 - 2357 number of orders in the region with maximum amount of sales*/
SELECT count(*) 
FROM orders o
JOIN accounts a
ON a.id = o.account_id
JOIN sales_reps s
ON s.id = a.sales_rep_id
JOIN region r
ON r.id = s.region_id
WHERE r.name = (SELECT r.name regname
				FROM orders o
				JOIN accounts a
	            ON a.id = o.account_id
	            JOIN sales_reps s
	            ON s.id = a.sales_rep_id
	            JOIN region r
				ON r.id = s.region_id
				GROUP BY r.name
				ORDER BY SUM(total_amt_usd) desc
				LIMIT 1);

/*Query 3 - Count the accounts which have total_qty greater than the account with max standard_qty purchased
1. Aggregate functions are not allowed in where*/
/*Query 3*/  
SELECT count(*)
FROM (SELECT a.name,sum(o.total) TOtal_qty, sum(o.standard_qty) Standard_qty
FROM accounts a
JOIN orders o
ON o.account_id = a.id
GROUP BY a.name) t1
WHERE Total_qty > (SELECT sum(o.total)
				FROM orders o
				JOIN accounts a
	            ON a.id = o.account_id
				GROUP BY a.name
				ORDER BY SUM(o.standard_qty) desc
				LIMIT 1);

/*Query 4  - EOG Resources - 12,4,44,11,13,5 - a,b,d,f,o,t*/
SELECT a.name, w.channel, count(*) 
FROM web_events w
JOIN accounts a
ON a.id = w.account_id
WHERE a.name = (SELECT a.name accname
				FROM orders o
				JOIN accounts a
	            ON a.id = o.account_id
	            JOIN sales_reps s
	            ON s.id = a.sales_rep_id
	            JOIN region r
				ON r.id = s.region_id
				GROUP BY a.name
				ORDER BY SUM(total_amt_usd) desc
				LIMIT 1)
GROUP BY a.name, w.channel;	

/*Query 5 - Life time avg. amount spent for the top 1- spending amounts

1. This was an overkill
2. Knowing the meaning is important
3. Lifetime average amount is something which is the average of the amounts during the period under consideration
4. 
*/
SELECT m2.aname account_name, (m2.total_spent/m2.num_orders) lif_avg_spent
FROM  (SELECT a.name aname, sum(o.total_amt_usd) total_spent, count(*) num_orders 
       FROM orders o
       JOIN accounts a
       ON a.id = o.account_id
       GROUP BY a.name) m2
JOIN  (SELECT a.name accname, sum(o.total_amt_usd) total_spent
				FROM orders o
				JOIN accounts a
	            ON a.id = o.account_id
	            JOIN sales_reps s
	            ON s.id = a.sales_rep_id
	            JOIN region r
				ON r.id = s.region_id
				GROUP BY a.name
				ORDER BY SUM(total_amt_usd) desc
				LIMIT 10) m1
ON m1.accname = m2.aname
ORDER BY lif_avg_spent desc;

/*Ans*/
SELECT avg(total_spent)
FROM(
SELECT a.name accname, sum(o.total_amt_usd) total_spent
				FROM orders o
				JOIN accounts a
	            ON a.id = o.account_id
	            JOIN sales_reps s
	            ON s.id = a.sales_rep_id
	            JOIN region r
				ON r.id = s.region_id
				GROUP BY a.name
				ORDER BY SUM(total_amt_usd) desc
				LIMIT 10) m1;

/*Query 6 - What is the lifetime average amount spent in terms of total_amt_usd for only 
the companies that spent more than the average of all orders.*/
SELECT m2.aname account_name, (m2.total_spent/m2.num_orders) lif_avg_spent
FROM  (SELECT a.name aname, sum(o.total_amt_usd) total_spent, count(*) num_orders 
       FROM orders o
       JOIN accounts a
       ON a.id = o.account_id
       GROUP BY a.name) m2
WHere (m2.total_spent/m2.num_orders) > (Select avg(total_amt_usd)
from orders)
ORDER BY lif_avg_spent desc;

/*ANs*/
SELECT AVG(avg_amt)
FROM (SELECT o.account_id, AVG(o.total_amt_usd) avg_amt
    FROM orders o
    GROUP BY 1
    HAVING AVG(o.total_amt_usd) > (SELECT AVG(o.total_amt_usd) avg_all
                                   FROM orders o)) temp_table;


/*
Learning:
1. Take the advantage of HAVING for column wise aggregations
*/	