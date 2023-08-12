USE 365_database;

-- Q: How many free students are there?
SELECT 
    COUNT(si.student_id) AS free_students
FROM
    365_student_info AS si
WHERE
    NOT EXISTS( SELECT 
            1
        FROM
            365_student_purchases AS sp
        WHERE
            si.student_id = sp.student_id);

-- Use LEFT OUTER JOIN with exclusion. Got result: 33095 rows
/*SELECT 
    COUNT(si.student_id) AS free_students
FROM
    365_student_info AS si
LEFT OUTER JOIN
    365_student_purchases AS sp
	ON si.student_id = sp.student_id
    WHERE sp.student_id IS NULL;*/ 
        
-- Use ANTI JOIN?. Got result: 33095 rows
/*SELECT 
    COUNT(si.student_id) AS free_students
FROM
    365_student_info AS si
WHERE
    student_id NOT IN (SELECT DISTINCT
            student_id
        FROM
            365_student_purchases);*/