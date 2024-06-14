/*
Returns all of the products no matter category and divided into price brackets. 
*/

WITH categories AS (
  SELECT mp.listprice, NTILE(6) OVER (ORDER BY mp.listprice) AS category
  FROM production.product as mp
)
SELECT CASE
  WHEN category = 3 then '$2 to $50'
  WHEN category = 4 then '$50 to $330'
  WHEN category = 5 then '$330 to $1K'
  WHEN category = 6 then '$1K to $3.5K'
  END AS Price_Brackets
  , MAX(mp.listprice) - MIN(mp.listprice) AS "Min price to Max Price"
  , count(*) AS "Total # of Products"
FROM categories
JOIN production.product as mp
USING(listprice)
WHERE mp.listprice > 0
GROUP BY category
ORDER BY category