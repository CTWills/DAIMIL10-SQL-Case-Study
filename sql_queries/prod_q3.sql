/*
Returns all of the products no matter category and divided into price brackets. 
*/

WITH categories AS (
  SELECT 
    mp.listprice, 
    NTILE(4) OVER (ORDER BY mp.listprice) AS category
  FROM 
    production.product AS mp
  WHERE 
    mp.listprice > 0
),
aggregated_categories AS (
  SELECT 
    category,
    MIN(listprice) AS min_price,
    MAX(listprice) AS max_price,
    COUNT(*) AS total_products
  FROM 
    categories
  GROUP BY 
    category
)
SELECT 
    CASE
    WHEN category = 1 THEN CONCAT('$', MIN(min_price)::text, ' to $', MAX(max_price)::text)
    WHEN category = 2 THEN CONCAT('$', MIN(min_price)::text, ' to $', MAX(max_price)::text)
    WHEN category = 3 THEN CONCAT('$', MIN(min_price)::text, ' to $', MAX(max_price)::text)
    WHEN category = 4 THEN CONCAT('$', MIN(min_price)::text, ' to $', MAX(max_price)::text)
  END AS price_bracket,
  min_price,
  max_price,
  max_price - min_price AS range,
  total_products
FROM 
  aggregated_categories
GROUP BY category, min_price, max_price, max_price - min_price, total_products
ORDER BY category;