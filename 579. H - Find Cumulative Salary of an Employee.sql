#The Employee table holds the salary information in a year.

#Write a SQL to get the cumulative sum of an employee's salary over a period of 3 months but exclude the most recent month.

#The result should be displayed by 'Id' ascending, and then by 'Month' descending.

# Write your MySQL query statement below

with temp as(
select id , month , salary , rnk from (
select id , month , salary , rank() over (partition by id order by month desc) as rnk
from employee
) a
where rnk > 1 
)

select id, month, sum(salary) over(partition by id  order by month rows between 2 preceding and 0 following) as Salary
from temp
GROUP BY Id, Month , salary
order by id asc , month desc
