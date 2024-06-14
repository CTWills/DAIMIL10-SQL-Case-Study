/*
Returns the lowest and highest price per category, 
the difference between those prices,
the name of each category,
and how many products are in each category
*/
SELECT pc.name AS main_category
  , MIN(mp.listprice) AS lowest_price
  , MAX(mp.listprice) AS highest_price
  , MAX(mp.listprice) - MIN(mp.listprice) AS difference_between_prices
  , COUNT(*) AS total_products
FROM production.productcategory pc
JOIN production.productsubcategory psc
USING(productcategoryid)
JOIN production.product as mp
  ON psc.productsubcategoryid = mp.productsubcategoryid
GROUP BY main_category
ORDER BY total_products DESC
;