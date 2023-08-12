USE 365_database;

/*Q: Calculate total students according to their subscription type
There are 1544 students purchase annually, 611 student purchase monthly, and 38 students purchase quartely
The result seems ambigue, if we sum it all manually, total student who purchase course is just 2193 (isn't this should be 2135?)
*/
SELECT 
    COUNT(DISTINCT si.student_id) AS total_student, purchase_type
FROM
    365_student_purchases AS sp
JOIN
	365_student_info AS si
    ON sp.student_id = si.student_id
GROUP BY purchase_type
ORDER BY total_student DESC;