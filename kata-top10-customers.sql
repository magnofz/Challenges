SELECT c.customer_id,
c.email,
COUNT (DISTINCT p.payment_id) AS "payments_count",
CAST (SUM(p.amount) AS FLOAT) AS "total_amount"

FROM customer AS c
INNER JOIN payment as p ON c.customer_id = p.customer_id

GROUP BY c.customer_id, c.email

ORDER BY "total_amount" DESC

LIMIT 10