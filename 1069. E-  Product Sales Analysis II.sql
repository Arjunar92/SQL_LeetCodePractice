#Write an SQL query that reports the total quantity sold for every product id

select product_id, sum(quantity) as total_quantity   from sales
group by product_id
