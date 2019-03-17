/*Query 1
1. Can use only columns within the table not the newly created columns within the concat function*/
SELECT
CONCAT(
  LEFT(primary_poc, STRPOS(primary_poc,' ')-1),
  '.',
  RIGHT(primary_poc, Length(primary_poc) - STRPOS(primary_poc,' ')),
  '@',
  name,
  '.com') AS email 
FROM accounts;

/*Query 2
1. Removed spaces from the company name  and concatenated for email id*/
SELECT
lower(CONCAT(
  LEFT(primary_poc, STRPOS(primary_poc,' ')-1),
  '.',
  RIGHT(primary_poc, Length(primary_poc) - STRPOS(primary_poc,' ')),
  '@',
  replace(name,' ',''),
  '.com')) AS email 
FROM accounts;

/*Query 3
1. This also worked.
2. The order of left, lower functions doesn't matter as far as the logic is clear.*/
SELECT *,
CONCAT(lower(LEFT(primary_poc,1)),
       lower(RIGHT(left(primary_poc,strpos(primary_poc,' ')-1),1)),
       lower(left(right(primary_poc,length(primary_poc) - strpos(primary_poc, ' ')),1)),
       lower(right(primary_poc,1)),
       length(left(primary_poc,strpos(primary_poc,' ')-1)),
       length(right(primary_poc,length(primary_poc) - strpos(primary_poc,' '))),
       UPPER(replace(name,' ','')) 
       ) 
FROM accounts;      

  SELECT CONCAT(
         LEFT(lower(primary_poc),1),
         RIGHT(left(lower(primary_poc),strpos(primary_poc,' ')-1),1),
         left(right(lower(primary_poc),length(primary_poc) - strpos(primary_poc, ' ')),1),
         right(lower(primary_poc),1),
         length(left(lower(primary_poc),strpos(primary_poc,' ')-1)),
         length(right(lower(primary_poc),length(primary_poc) - strpos(primary_poc, ' '))),
         replace(Upper(name),' ','')
         ) AS init_password
  FROM accounts;   

/*Final*/
SELECT (LEFT(lower(primary_poc),1) ||
       RIGHT(left(lower(primary_poc),strpos(primary_poc,' ')-1),1) ||
       left(right(lower(primary_poc),length(primary_poc) - strpos(primary_poc, ' ')),1) ||
       right(lower(primary_poc),1) ||
       length(left(lower(primary_poc),strpos(primary_poc,' ')-1)) ||
       length(right(lower(primary_poc),length(primary_poc) - strpos(primary_poc, ' '))) ||
       replace(Upper(name),' ',''))
        AS init_password
FROM accounts; 