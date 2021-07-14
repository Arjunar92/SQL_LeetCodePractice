
#Assume today's date is '2021-1-1'.

#Write an SQL query that will, for each user_id, find out the largest window of days between each visit and the one right after it (or today if you are considering the last visit).

#Return the result table ordered by user_id.

#The query result format is in the following example:

select user_id  , max(thdn) as biggest_window

from(
select user_id ,
datediff(lead(visit_date, 1 , '2021-1-1') over(partition by user_id order by visit_date asc), visit_date) as thdn 
from uservisits) as b

group by user_id

