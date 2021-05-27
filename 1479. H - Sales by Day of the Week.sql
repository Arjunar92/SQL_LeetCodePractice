#You are the business owner and would like to obtain a sales report for category items and day of the week.

#Write an SQL query to report how many units in each category have been ordered on each day of the week.

#Return the result table ordered by category.




with temp as
(
select dayname(order_date) as day_of_week,  item_category as category, sum(quantity) tot_quantity
from orders o right outer join items i
on i.item_id = o.item_id
group by day_of_week, item_category
)

select CATEGORY ,
sum(case when day_of_week = 'Monday' then tot_quantity else 0 end) MONDAY,
sum(case when day_of_week = 'Tuesday' then tot_quantity else 0 end) TUESDAY,
sum(case when day_of_week = 'Wednesday' then tot_quantity else 0 end) WEDNESDAY,
sum(case when day_of_week = 'Thursday' then tot_quantity else 0 end) THURSDAY,
sum(case when day_of_week = 'Friday' then tot_quantity else 0 end) FRIDAY,
sum(case when day_of_week = 'Saturday' then tot_quantity else 0 end) SATURDAY,
sum(case when day_of_week = 'Sunday' then tot_quantity else 0 end) SUNDAY
from temp
group by CATEGORY
order by CATEGORY 
