/*QUery 3
1. TO check within a set WHEN IN ('0','1','2') can be used rather than using multiple ORs
2. Extra calculation till calculating the proportion is done*/

WITH t1 AS (select count(*)
            FROM accounts)
SELECT
	CASE WHEN LEFT(name,1) = '0' OR
	          LEFT(name,1) = '1' OR
	          LEFT(name,1) = '2' OR 
	          LEFT(name,1) = '3' OR 
	          LEFT(name,1) = '4' OR
	          LEFT(name,1) = '5' OR
	          LEFT(name,1) = '6' OR
	          LEFT(name,1) = '7' OR
	          LEFT(name,1) = '8' OR
	          LEFT(name,1) = '9' THEN 'Number' 
    ELSE 'Letter'
    END AS name_starts_with, count(*)*100/(select * from t1) proportion
    
FROM accounts
GROUP BY name_starts_with;


/*Query 4
1. First letter of the company name starts with an upper case
*/

WITH t1 AS (select count(*)
            FROM accounts)
SELECT
	CASE WHEN LEFT(name,1) = 'A' OR 
    	  LEFT(name,1) = 'E' OR 
          LEFT(name,1) = 'I' OR 
          LEFT(name,1) = 'O' OR 
          LEFT(name,1) = 'U' THEN 'Vowel' 
    ELSE 'Other'
    END AS vowel_or_other, round(count(*)*100/ (select * from t1),6) as proportion
    
FROM accounts
GROUP BY vowel_or_other;