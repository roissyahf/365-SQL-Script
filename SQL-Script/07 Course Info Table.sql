USE 365_database;

/*Focus on creating table for Course Info as part of Dashboard skeleton
course_id | course_title | total_minutes_watched | avg_minutes_watched | avg_rating | number_of_ratings | total_students_enrolled
*/

SELECT 
    ci.course_id, ci.course_title,
    ROUND(SUM(sl.minutes_watched),2) AS total_minutes_watched,
    ROUND(AVG(sl.minutes_watched),2) AS avg_minutes_watched,
    ROUND(AVG(cr.course_rating),2) AS avg_rating,
    ROUND(COUNT(DISTINCT cr.student_id),2) AS number_of_ratings,
    ROUND(COUNT(DISTINCT si.student_id),2) AS total_students_enrolled
FROM
    365_course_info AS ci
        JOIN
    365_student_learning AS sl ON ci.course_id = sl.course_id
		JOIN
	365_course_ratings AS cr ON sl.course_id = cr.course_id
		JOIN
	365_student_info AS si ON sl.student_id = si.student_id
GROUP BY 1, 2
ORDER BY avg_rating DESC;
