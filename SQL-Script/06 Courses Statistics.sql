USE 365_database;

-- *Q: How many courses available? There are total of 46 courses available

SELECT 
    COUNT(DISTINCT course_id) AS total_courses
FROM
    365_course_info;

-- Q: How's the average minutes watched? The average minutes watched is 28.55 minutes
/*SELECT
    ROUND(AVG(sl.minutes_watched),2) AS avg_minutes_watched
FROM
    365_course_info AS ci
        JOIN
    365_student_learning AS sl ON ci.course_id = sl.course_id;*/
    
-- Q: How's the average course rating given by the students? The average course rating is 4.79
/*SELECT 
    ROUND(AVG(cr.course_rating),2) AS avg_rating
FROM
    365_course_info AS ci
        JOIN
    365_course_ratings AS cr ON ci.course_id = cr.course_id;*/