ALTER TABLE cust_dimen ALTER COLUMN Cust_id nvarchar(50) NOT NULL
ALTER TABLE cust_dimen 
ADD CONSTRAINT pk_cust PRIMARY KEY (Cust_id)

select *
from[dbo].[shipping_dimen]
select *
from[dbo].[orders_dimen]

---CREATE TABLE suppliers


--Pk define---------------

--1.Cust_dimen table
ALTER TABLE cust_dimen ALTER COLUMN Cust_id nvarchar(50) NOT NULL
ALTER TABLE cust_dimen 
ADD CONSTRAINT pk_cust PRIMARY KEY (Cust_id)

--2.Orders_dimen table
ALTER TABLE orders_dimen ALTER COLUMN Ord_id nvarchar(50) NOT NULL
ALTER TABLE orders_dimen
ADD CONSTRAINT pk_ord PRIMARY KEY (Ord_id)

--3.Prod_dimen table
ALTER TABLE prod_dimen$ ALTER COLUMN Prod_id nvarchar(255) NOT NULL
ALTER TABLE prod_dimen$
ADD CONSTRAINT pk_prod PRIMARY KEY (Prod_id)

--4.Shipping_dimen table
ALTER TABLE shipping_dimen ALTER COLUMN Ship_id nvarchar(50) NOT NULL
ALTER TABLE shipping_dimen
ADD CONSTRAINT pk_ship PRIMARY KEY (Ship_id)


----DEFİNE FK----------------------------------------------
---1.FK_Cust
ALTER TABLE market_fact$
alter column Cust_id nvarchar(50);

Alter table market_fact$ add constraint FK_Cust Foreign key (Cust_id) References Cust_dimen(Cust_id)


--2.FK_Ord--------------
ALTER TABLE market_fact$
alter column Ord_id nvarchar(50);


Alter table market_fact$ add constraint FK_Ord Foreign key (Ord_id) References Orders_dimen(Ord_id)

--3.FK_Prod----------

Alter table market_fact$ add constraint FK_Prod Foreign key (Prod_id) References Prod_dimen$(Prod_id)

--4.FK_Ship---
ALTER TABLE market_fact$
alter column Ship_id nvarchar(50);


Alter table market_fact$ add constraint FK_Ship Foreign key (Ship_id) References Shipping_dimen(Ship_id)





---1. Using the columns of “market_fact”, “cust_dimen”, “orders_dimen”, “prod_dimen”, “shipping_dimen”, Create a new table, named as “combined_table”. 


SELECT a.Cust_id,a.Customer_Name,a.Customer_Segment,a.Province,a.Region,c.Ord_id,c.Order_Date,c.Order_Priority,d.Prod_id,d.Product_Category,
d.Product_Sub_Category,e.Order_ID,e.Ship_Date,e.Ship_id,e.Ship_Mode,b.Discount,b.Order_Quantity,b.Product_Base_Margin,b.Sales
INTO combined_table
FROM dbo.cust_dimen a, dbo.market_fact$ b, dbo.orders_dimen c, dbo.prod_dimen$ d, dbo.shipping_dimen e
WHERE a.Cust_id = b.Cust_id and c.Ord_id = b.Ord_id and d.Prod_id = b.Prod_id and e.Ship_id = b.Ship_id


select*
from dbo.combined_table

---2. Find the top 3 customers who have the maximum count of orders.

select top 3 Cust_id, Customer_Name, COUNT(Ord_id) orders_count
from dbo.combined_table
group by Cust_id, Customer_Name
order by orders_count desc


---3. Create a new column at combined_table as DaysTakenForDelivery that contains the date difference of Order_Date and Ship_Date

ALTER TABLE combined_table
ADD 
  [DaysTakenForDelivery] AS DATEDIFF (DAY,Order_Date,Ship_Date) PERSISTED


select*
from dbo.combined_table


--4. Find the customer whose order took the maximum time to get delivered.
--Use "MAX" or "TOP"

select top 1 Cust_id, Customer_Name, DaysTakenForDelivery
from dbo.combined_table
order by DaysTakenForDelivery desc


--5. Count the total number of unique customers in January and how many of them came back every month over the entire year in 2011
--You can use date functions and subqueries



select distinct month(Order_Date) [month], count(distinct(Cust_id)) num_uniq_cust
from combined_table
where year(Order_Date) = 2011 and Cust_id	in	(select distinct Cust_id
												from combined_table
												where year(Order_Date) = 2011 and month(Order_Date) = 1
												)
group by month(Order_Date)




--6. write a query to return for each user acording to the time elapsed between the first purchasing and the third purchasing, 
--in ascending order by Customer ID
--Use "MIN" with Window Functions

create view first_purc as
with first_purc1 as
					(select Cust_id,Customer_Name,Order_Date, ROW_NUMBER () over (partition by Cust_id order by Order_Date) first_purc
					from combined_table
					)
select *
from first_purc1
where first_purc = 1




create view third_purc as
with third_purc1 as
					(select Cust_id,Customer_Name,Order_Date, ROW_NUMBER () over (partition by Cust_id order by Order_Date) third_purc
					from combined_table
					)
select *
from third_purc1
where third_purc = 3



select a.Cust_id,a.Customer_Name,a.Order_Date,b.Order_Date, DATEDIFF(day, a.Order_Date,b.Order_Date)  between_purc
from first_purc a, third_purc b
where a.Cust_id = b.Cust_id


--7. Write a query that returns customers who purchased both product 11 and product 14, 
--as well as the ratio of these products to the total number of products purchased by all customers.
--Use CASE Expression, CTE, CAST and/or Aggregate Functions

select Cust_id,Customer_Name,Prod_id
from combined_table
where Prod_id in ('prod_11','prod_14')


select Cust_id
from combined_table
where Prod_id in ('prod_11','prod_14')
group by Cust_id
having sum(case when Prod_id = 'prod_11' then 1 else 0 end) > 0 and
       sum(case when Prod_id = 'prod_14' then 1 else 0 end) = 0 ;




with tbl as
(select Cust_id,Customer_Name,count(cust_id) [count]
from combined_table
where Prod_id = 'prod_11' or Prod_id = 'prod_14'
group by cust_id,Customer_Name)
select*
from tbl
where [count] = 2




--CUSTOMER SEGMENTATION


--1. Create a view that keeps visit logs of customers on a monthly basis. (For each log, three field is kept: Cust_id, Year, Month)
--Use such date functions. Don't forget to call up columns you might need later.

create view monthly_visit as
							(select Cust_id,Customer_Name,year(order_date) [year], month(Order_Date) [month]
							from combined_table
							)

select *
from monthly_visit
order by Cust_id,year,month


select Cust_id,Customer_Name,year(order_date) [year], month(Order_Date) [month]

from combined_table


--2.Create a “view” that keeps the number of monthly visits by users. (Show separately all months from the beginning  business)
--Don't forget to call up columns you might need later.

create view monthly_visit1 as
(select distinct year, month, count(cust_id) over (partition by month order by  month, year) monthly_visit
from monthly_visit
)


select*
from monthly_visit1
order by year, month 




--3. For each visit of customers, create the next month of the visit as a separate column.
--You can order the months using "DENSE_RANK" function.
--then create a new column for each month showing the next month using the order you have made above. (use "LEAD" function.)
--Don't forget to call up columns you might need later.


-----????????????

select Cust_id, Customer_Name, Order_Date, DENSE_RANK() over (partition by Cust_id order by month(Order_Date)),
LEAD(Order_Date) over (partition by Cust_id order by month(Order_Date))
from combined_table



--4. Calculate the monthly time gap between two consecutive visits by each customer.
--Don't forget to call up columns you might need later.

select*

from
(
select Cust_id, Customer_Name, Order_Date, DENSE_RANK() over (partition by Cust_id order by month(Order_Date)) dense,
LEAD(Order_Date) over (partition by Cust_id order by month(Order_Date)) next_month
from combined_table
)





--5.Categorise customers using average time gaps. Choose the most fitted labeling model for you.
--For example: 
--Labeled as “churn” if the customer hasn't made another purchase for the months since they made their first purchase.
--Labeled as “regular” if the customer has made a purchase every month.
--Etc.
	






--MONTH-WISE RETENTÝON RATE


--Find month-by-month customer retention rate  since the start of the business.


--1. Find the number of customers retained month-wise. (You can use time gaps)
--Use Time Gaps

select distinct  year(order_date), month(order_date),count(cust_id) over (partition by year(order_date), month(order_date))
from combined_table
order by year(order_date), month(order_date)





select distinct  year(b.order_date), month(b.order_date),count(b.cust_id) over (partition by year(b.order_date), month(b.order_date))
from

(select distinct Cust_id,order_date
from combined_table
where year(order_date) = 2009 and month(order_date) = 2 ) b,

(select distinct Cust_id,Order_Date
from combined_table
where year(order_date) = 2009 and month(order_date) = 1 ) a

where a.cust_id = b. cust_id







--2. Calculate the month-wise retention rate.

--Basic formula: o	Month-Wise Retention Rate = 1.0 * Number of Customers Retained in The Current Month / Total Number of Customers in the Current Month

--It is easier to divide the operations into parts rather than in a single ad-hoc query. It is recommended to use View. 
--You can also use CTE or Subquery if you want.

--You should pay attention to the join type and join columns between your views or tables.