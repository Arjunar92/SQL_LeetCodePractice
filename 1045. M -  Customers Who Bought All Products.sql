#Write an SQL query for a report that provides the customer ids from the Customer table that bought all the products in the Product table.

#Return the result table in any order.

#The query result format is in the following example:



select customer_id from 
(
select customer_id , count( distinct product_key) as prod_num
from Customer
group by customer_id
having prod_num = (select count(distinct product_key) from product) 
    )a
