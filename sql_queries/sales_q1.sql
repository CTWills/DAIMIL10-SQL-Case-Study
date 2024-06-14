SELECT TO_CHAR(soh.orderdate, 'YYYY/Month') AS order_placed
  , SUM(soh.subtotal) AS sum_subtotal
FROM sales.salesorderheader AS soh
WHERE soh.status =5
GROUP BY 1
ORDER BY 1 DESC