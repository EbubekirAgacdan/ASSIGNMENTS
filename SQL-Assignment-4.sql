CREATE VIEW TBL
AS      (

		select distinct product_id,discount,
				lead(discount) over (partition by product_id order by discount) next_discount,
				sum(quantity) total_quantity,
				lead(sum(quantity)) over (partition by product_id order by discount) next_quantity
		from sale.order_item
		group by product_id,discount
		)


with TBL_1 as (
				select product_id,	
						sum((next_quantity - total_quantity) / (next_discount - discount)) eðim
				from TBL
				group by product_id
			  )
SELECT product_id,
	    CASE  
		     WHEN eðim > 0 then 'Positive'
			 WHEN eðim = 0 then 'Neutral'
		     WHEN eðim < 0 then 'Negative'
		END AS discount_effect
FROM TBL_1
