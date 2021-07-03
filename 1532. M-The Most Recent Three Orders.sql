#Write an SQL query to find the most recent 3 orders of each user. If a user ordered less than 3 orders return all of their orders.

#Return the result table sorted by customer_name in ascending order and in case of a tie by the customer_id in ascending order. If there still a tie, order them by the order_date in descending order.


# Write your MySQL query statement below


 
select name as customer_name , b.customer_id , order_id , order_date from (
    
select customer_id , order_id , order_date , rank() over(partition by customer_id order by order_date desc) as rnk

from orders) b

inner join customers c

on c.customer_id = b.customer_id

where rnk < 4

order by customer_name , customer_id , order_date desc
