/*
Returns the lowest and highest price per subcategory, 
the difference between those prices,
the name of each subcategory,
and how many products are in each subcategory
*/

SELECT psc.name AS sub_category
  , MIN(mp.listprice) AS lowest_price
  , MAX(mp.listprice) AS highest_price
  , MAX(mp.listprice) - MIN(mp.listprice) AS difference_between_prices
  , COUNT(mp.*) AS total_products
FROM production.productsubcategory psc
JOIN production.product as mp
  ON psc.productsubcategoryid = mp.productsubcategoryid
GROUP BY sub_category
ORDER BY sub_category, total_products 
  DESC
;