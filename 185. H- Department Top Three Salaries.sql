
#A company's executives are interested in seeing who earns the most money in each of the company's departments. A high earner in a department is an employee who has a salary in the top three unique salaries for that department.

#Write an SQL query to find the employees who are high earners in each of the departments.

#Return the result table in any order.

#The query result format is in the following example:

# Write your MySQL query statement below



select department , employee , salary from
(
select d.name as  Department  , e.name as employee , salary , 
dense_rank() over(partition by d.name order by salary desc) as ranks 

from employee e inner join department d
on e.departmentid = d.id
) as e

where ranks <= 3
