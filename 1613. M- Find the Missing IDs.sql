
#Write an SQL query to find the missing customer IDs. The missing IDs are ones that are not in the Customers table but are in the range between 1 and the maximum customer_id present in the table.

#Notice that the maximum customer_id will not exceed 100.

#Return the result table ordered by ids in ascending order.
 
with RECURSIVE seq_i as
(
select 1 as value
    
union all
    
select value+ 1 from seq_i where value < (select max(customer_id) from customers)
    
)

select value as ids

from seq_i

where value not in (select customer_id from customers)
