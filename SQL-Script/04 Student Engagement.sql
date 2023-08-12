USE 365_database;

/*
How's the student engagement?
(I choose to take exam_category IN (1,4) to measure whether student passed the course and career track or not)
*/

SELECT 
    seng.student_id,
    seng.engagement_quizzes,
    seng.engagement_exams,
    seng.engagement_lessons,
    ROUND(AVG(seng.engagement_quizzes + seng.engagement_exams + seng.engagement_lessons),2) AS avg_engagement,
    CASE
		WHEN  AVG(seng.engagement_quizzes + seng.engagement_exams + seng.engagement_lessons) >= 0.5 THEN 'active'
        ELSE 'passive'
	END AS engagement_status,
    seng.date_engaged,
    sx.exam_result,
    CASE
        WHEN sx.exam_result > 80 THEN 'passed'
        ELSE 'failed'
    END AS exam_status
FROM
    365_student_engagement AS seng
		JOIN
	365_exam_info AS ex
        JOIN
    365_student_exams AS sx
WHERE
    seng.student_id IN (SELECT 
            sx.student_id
        FROM
            365_student_exams)
	AND
    ex.exam_category IN (1,4)
GROUP BY 1;