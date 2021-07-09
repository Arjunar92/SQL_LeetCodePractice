
#Write an SQL query to report the number of bank accounts of each salary category. The salary categories are:

#"Low Salary": All the salaries strictly less than $20000.
#"Average Salary": All the salaries in the inclusive range [$20000, $50000].
#"High Salary": All the salaries strictly greater than $50000.
#The result table must contain all three categories. If there are no accounts in a category, then report 0. Return the result table in any order.


with cte1 as
(
select (case when income < 20000 then 'Low Salary'
                    when income >= 20000 and income <= 50000 then 'Average Salary'
                    else 'High Salary' end) as category , 
                    
                    count((case when income < 20000 then 'Low Salary'
                    when income >= 20000 and income <= 50000 then 'Average Salary'
                    else 'High Salary' end)) as accounts_count 
from accounts
group by category
),

cte2 as
(
select category, accounts_count  from (  
    select 'Low Salary' as category , 0 as accounts_count
    union
    select 'Average Salary' as category , 0 as accounts_count
    union
    select 'High Salary' as category , 0 as accounts_count
    ) as unb
where category not in (select category from cte1))



select * from cte1
union 
select * from cte2
