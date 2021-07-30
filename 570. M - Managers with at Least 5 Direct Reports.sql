#The Employee table holds all employees including their managers. Every employee has an Id, and there is also a column for the manager Id.

#Given the Employee table, write a SQL query that finds out managers with at least 5 direct report. For the above table, your SQL query should return


with temp as
(
select managerid, count(managerid) as manager_num from employee
group by managerid
having manager_num > 4
)

select name from employee e inner join temp t
on e.id = t.managerid
