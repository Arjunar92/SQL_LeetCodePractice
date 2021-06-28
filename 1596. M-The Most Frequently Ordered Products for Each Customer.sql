#Write an SQL query to find the most frequently ordered product(s) for each customer.

#The result table should have the product_id and product_name for each customer_id who ordered at least one order. Return the result table in any order.


# Write your MySQL query statement below

with temp as (
select customer_id , product_id  , count(product_id) as freq
from orders 
group by customer_id , product_id
order by customer_id , freq)

select customer_id  , p.product_id , product_name   from (
select customer_id  , product_id  , rank() over(partition by customer_id order by freq desc) as rnk
from temp) a 
inner join products p
on p.product_id = a.product_id
where rnk = 1
order by customer_id  , product_id 
