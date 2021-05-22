#Write a query to print the sum of all total investment values in 2016 (TIV_2016), to a scale of 2 decimal places, for all policy holders who meet the following criteria:

#Have the same TIV_2015 value as one or more other policyholders.
#Are not located in the same city as any other policyholder (i.e.: the (latitude, longitude) attribute pairs must be unique).

with temp as

(
select * , 
count(*) over (partition by lat,lon) cnt,
count(*) over (partition by tiv_2015) tiv
from insurance
)

select sum(tiv_2016) as TIV_2016
from temp
where tiv > 1 and cnt = 1
