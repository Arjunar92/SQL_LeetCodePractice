#Since some IDs have been removed from Logs. Write an SQL query to find the start and end number of continuous ranges in table Logs.

#Order the result table by start_id.




SELECT min(log_id) as start_id, max(log_id) as end_id
FROM
(SELECT log_id, ROW_NUMBER() OVER(ORDER BY log_id) as num
FROM Logs) a
GROUP BY log_id - num
