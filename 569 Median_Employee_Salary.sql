#Write a SQL query to find the median salary of each company


with temp as (
select id, company , salary, 
row_number() over(partition by company order by salary asc) as rk,
count(id) over (partition by company) as ct
from employee
order by company , salary desc
)



select id, company , salary
from temp
where
rk in ((case 
               when MOD(ct,2)=1 then ((ct+1)/2) 
               when MOD(ct,2)=0 then (ct/2)
               else 0 
               end),
               (case 
               when MOD(ct,2)=1 then ((ct+1)/2) 
               when MOD(ct,2)=0 then (ct/2)+1
               else 0 
               end) )


