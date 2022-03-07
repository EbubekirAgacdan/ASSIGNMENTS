
SELECT
base.customer_id,
base.first_name,
base.last_name,
ISNULL(NULLIF(ISNULL(NULLIF(f1.product_name,'Yes'), 'No'), 'Polk Audio - 50 W Woofer - Black'),'Yes') as first_product,
ISNULL(NULLIF(ISNULL(NULLIF(f2.product_name,'Yes'),'No'),'SB-2000 12 500W Subwoofer (Piano Gloss Black)'),'Yes') as second_product,
ISNULL(NULLIF(ISNULL(NULLIF(f3.product_name,'Yes'),'No'),'Virtually Invisible 891 In-Wall Speakers (Pair)'),'Yes') as third_product

FROM

(SELECT
A.customer_id,
A.first_name,
A.last_name
FROM sale.orders B 
INNER JOIN sale.customer A
ON A.customer_id = B.customer_id

INNER JOIN sale.order_item C
ON B.order_id = C.order_id

LEFT JOIN product.product D
ON C.product_id = D.product_id
WHERE D.product_name = '2TB Red 5400 rpm SATA III 3.5 Internal NAS HDD'
)  base

LEFT JOIN

(SELECT
A.customer_id,
A.first_name,
A.last_name,
D.product_name
FROM sale.orders B 
INNER JOIN sale.customer A
ON A.customer_id = B.customer_id

INNER JOIN sale.order_item C
ON B.order_id = C.order_id

LEFT JOIN product.product D
ON C.product_id = D.product_id
WHERE D.product_name = 'Polk Audio - 50 W Woofer - Black'
) f1

ON f1.customer_id = base.customer_id


LEFT JOIN

(SELECT
A.customer_id,
A.first_name,
A.last_name,
D.product_name
FROM sale.orders B 
INNER JOIN sale.customer A
ON A.customer_id = B.customer_id

INNER JOIN sale.order_item C
ON B.order_id = C.order_id

LEFT JOIN product.product D
ON C.product_id = D.product_id
WHERE D.product_name = 'SB-2000 12 500W Subwoofer (Piano Gloss Black)'
) f2
ON f2.customer_id = base.customer_id

LEFT JOIN

(SELECT
A.customer_id,
A.first_name,
A.last_name,
D.product_name
FROM sale.orders B 
INNER JOIN sale.customer A
ON A.customer_id = B.customer_id

INNER JOIN sale.order_item C
ON B.order_id = C.order_id

LEFT JOIN product.product D
ON C.product_id = D.product_id
WHERE D.product_name = 'Virtually Invisible 891 In-Wall Speakers (Pair)'
) f3
ON f3.customer_id = base.customer_id
ORDER BY base.customer_id