USE 365_database;

/*Q: How many paid students are there?
Assuming students can purchase more than one course, thus if we want to calculate total paid users we must use COUNTD.
Otherwise, if we use COUNT we obtained total paid user = 3041 (duplicate values included)*/

-- Only select distinct paid user, Got 2135 rows. Exactly the same as what i expected (i use SEMI JOIN)
SELECT 
    COUNT(DISTINCT sp.student_id) AS paid_students
FROM
    365_student_purchases AS sp
WHERE
    EXISTS( SELECT 
            1
        FROM
            365_student_info AS si
        WHERE
            sp.student_id = si.student_id);    
            
