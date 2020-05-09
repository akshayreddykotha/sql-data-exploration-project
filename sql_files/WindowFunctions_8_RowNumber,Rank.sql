/*Query 1*/
SELECT id, account_id, total,
RANK() OVER(PARTITION BY account_id ORDER BY total desc) total_rank
FROM orders;