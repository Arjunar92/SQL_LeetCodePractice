#Find the name of the user who has rated the greatest number of movies
#In case of a tie, return lexicographically smaller user name.

#Find the movie name with the highest average rating in February 2020.
#In case of a tie, return lexicographically smaller movie name.



with cte_1 as 
(
select m.user_id , u.name, count(m.rating) as num_rating 
    from movie_rating m inner join users u
    on m.user_id = u.user_id
    group by m.user_id
    order by u.name
),

cte_2 as(
select m.movie_id, mo.title, avg(m.rating) avg_rat
    from movie_rating m inner join movies mo
    on m.movie_id = mo.movie_id
    where year(m.created_at) = 2020 and   month(m.created_at) = 02
    group by m.movie_id
)


select name as results from 
(select name , num_rating, rank() over(order by name asc) as rnk from cte_1
where num_rating in (select max(num_rating) from cte_1)) as ab
where rnk = 1

UNION ALL

select title as results from
(select title , avg_rat , rank() over(order by title asc) as rnk from cte_2
where avg_rat in (select max(avg_rat) from cte_2)) as cd
where rnk = 1
