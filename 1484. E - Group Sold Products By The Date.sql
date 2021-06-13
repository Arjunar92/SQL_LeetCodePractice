#Write an SQL query to find for each date, the number of distinct products sold and their names.

#The sold-products names for each date should be sorted lexicographically. 

#Return the result table ordered by sell_date.



# Write your MySQL query statement below

select sell_date, count(distinct product) as num_sold, group_concat(distinct product order by product) as products
from activities
group by sell_date
