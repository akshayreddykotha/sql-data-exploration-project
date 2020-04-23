/*Query 2*/
SELECT COALESCE(a.id, a.id) AS modif_acc_id, *
FROM accounts a
LEFT JOIN orders o
ON a.id = o.account_id
WHERE o.total IS NULL;

/*Query 3 - Getting the table output as if there are no nulls is the goal*/
SELECT *, COALESCE(o.account_id, a.id) AS modif_o_acc_id
FROM accounts a
LEFT JOIN orders o
ON a.id = o.account_id
WHERE o.total IS NULL;

/*Query 4*/
SELECT *,
COALESCE(o.standard_qty,0) modified_st_qty,
COALESCE(o.poster_qty,0) modified_pos_qty,
COALESCE(o.gloss_qty,0) modified_gloss_qty,
COALESCE(o.standard_amt_usd,0) modified_std_amt,
COALESCE(o.gloss_amt_usd,0) modified_glo_amt,
COALESCE(o.poster_amt_usd,0) modified_pos_amt
FROM accounts a
LEFT JOIN orders o
ON a.id = o.account_id
WHERE o.total IS NULL;

/*Query 5*/
SELECT *,
COALESCE(a.id,a.id) modified_id,
COALESCE(o.account_id,a.id) modified_acc,
COALESCE(o.standard_qty,0) modified_st_qty,
COALESCE(o.poster_qty,0) modified_pos_qty,
COALESCE(o.gloss_qty,0) modified_gloss_qty,
COALESCE(o.standard_amt_usd,0) modified_std_amt,
COALESCE(o.gloss_amt_usd,0) modified_glo_amt,
COALESCE(o.poster_amt_usd,0) modified_pos_amt
FROM accounts a
LEFT JOIN orders o
ON a.id = o.account_id
WHERE o.total IS NULL;

/*Query 6 - without the WHERE - number of ids - new table after appying coalesce to all the required columns*/
SELECT *,
COALESCE(a.id,a.id) modified_id,
COALESCE(o.account_id,a.id) modified_acc,
COALESCE(o.standard_qty,0) modified_st_qty,
COALESCE(o.poster_qty,0) modified_pos_qty,
COALESCE(o.gloss_qty,0) modified_gloss_qty,
COALESCE(o.standard_amt_usd,0) modified_std_amt,
COALESCE(o.gloss_amt_usd,0) modified_glo_amt,
COALESCE(o.poster_amt_usd,0) modified_pos_amt
FROM accounts a
LEFT JOIN orders o
ON a.id = o.account_id;


