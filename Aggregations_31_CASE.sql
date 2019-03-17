/*Query 1 - 6912 */
SELECT account_id,total_amt_usd, 
       CASE WHEN total_amt_usd >= 3000 THEN 'Large'
       ELSE 'Small' END AS Level_of_order
FROM orders;

/*Query 2 - 4072,1570,1270
Total numer of orders - categories was asked*/
SELECT CASE 
WHEN total_amt_usd >= 2000 THEN 'Atleast 2000'
WHEN total_amt_usd < 2000 AND total_amt_usd >= 1000 THEN 'Between 1000 and 2000'
WHEN total_amt_usd < 1000 THEN 'Less than 1000'
END AS Level_of_order,COUNT(*)
FROM orders
GROUP BY Level_of_order;

/*Query 3 - Top 3: EOG, Mosaic, IBM*/
SELECT a.name Account_name, sum(o.total_amt_usd) Total_spent, 
	CASE 
		WHEN SUM(o.total_amt_usd) > 200000 THEN 'greater than 200000'
		WHEN SUM(o.total_amt_usd) <= 200000 AND sum(o.total_amt_usd) >= 100000 				THEN 'Between 100000 and 200000'
		WHEN SUM(o.total_amt_usd) < 100000 THEN 'Under 100000'
	END AS Level
FROM orders o
JOIN accounts a
ON a.id = o.account_id
GROUP BY a.name
ORDER BY SUM(total_amt_usd) DESC;

/*Query 4 - 322, Pacific Life, Mosaic, CHS */
SELECT a.name Account_name, sum(o.total_amt_usd) Total_spent, 
	CASE 
		WHEN SUM(o.total_amt_usd) > 200000 THEN 'greater than 200000'
		WHEN SUM(o.total_amt_usd) <= 200000 AND sum(o.total_amt_usd) >= 100000 				THEN 'Between 100000 and 200000'
		WHEN SUM(o.total_amt_usd) < 100000 THEN 'Under 100000'
	END AS Level
FROM orders o
JOIN accounts a
ON a.id = o.account_id
WHERE o.occurred_at BETWEEN '2016-01-01' AND '2018-01-01' 
GROUP BY a.name
ORDER BY SUM(total_amt_usd) DESC;

/*Query 5 - Subquery table never ends with semi-colon. earlie, vernita, tia are the top 3. - 50*/
SELECT rep_name, Number,
	   CASE WHEN Number > 200 THEN 'top'
       ELSE 'not' END AS top_or_not 
FROM (SELECT s.name As rep_name, count(*) AS Number
	FROM orders o
	JOIN accounts a
	ON a.id = o.account_id
	JOIN sales_reps s
	ON a.sales_rep_id = s.id	
	GROUP BY s.name) AS Topnot
Order BY top_or_not DESC, number desc;

/*Query 6 - 50 - earlie, vernita, tia - there are few upsets as quoted*/
SELECT rep_name, Number, total_sales,
	   CASE 
       WHEN Number > 200 OR total_sales > 750000 THEN 'top'
       WHEN (Number >150 AND Number <=200) OR (total_sales > 500000 and total_sales <= 750000) THEN 'middle'
       ELSE 'low' END AS tmn 
FROM (SELECT s.name As rep_name, count(*) AS Number, sum(total_amt_usd) as total_sales
	FROM orders o
	JOIN accounts a
	ON a.id = o.account_id
	JOIN sales_reps s
	ON a.sales_rep_id = s.id	
	GROUP BY s.name) AS Topnot
Order BY total_sales desc;

/*Use 1, 2, 3 to denote columns in ORDER BY and GROUP BY*/