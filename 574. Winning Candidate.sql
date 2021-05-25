# Write your MySQL query statement below

select name from candidate c
inner join 
(select CandidateId, count(CandidateId) as cnd_id from vote
group by CandidateId
order by cnd_id desc
LIMIT 1) as v
where c.id = v.CandidateId
