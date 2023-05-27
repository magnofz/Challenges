SELECT
p.name AS product_name,
EXTRACT(year FROM s.date ) AS "year",
EXTRACT(month FROM s.date ) AS "month",
EXTRACT(day FROM s.date ) AS "day",
SUM(p.price * sd.count) AS total


FROM sales_details AS sd
INNER JOIN products AS p ON sd.product_id = p.id
INNER JOIN sales AS s ON sd.sale_id = s.id

GROUP BY
GROUPING SETS ((product_name, "year", "month","day"),
               (product_name, "year", "month"),
               (product_name, "year"),
               (product_name))

ORDER BY product_name, "year", "month", "day"