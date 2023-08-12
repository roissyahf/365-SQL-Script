USE 365_database;

/*total student onboarded (at least they have done at least one of the following: watched a video, solved a quiz, attempted an exam)
date engaged recorded from 2022-01-01 until 2022-10-20
output: 18347*/
SELECT 
    COUNT(student_id)
FROM
    365_student_info
WHERE
    student_id IN (SELECT 
            student_id
        FROM
            365_student_engagement);