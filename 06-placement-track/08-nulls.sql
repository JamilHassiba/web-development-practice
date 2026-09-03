-- 66. Return every role's title and salary, showing 0 where salary is NULL --
SELECT title, COALESCE(salary, 0) AS salary FROM roles;

-- 67. Return every role's title and salary, showing the text 'Not disclosed' where salary is NULL. (Watch your data types.) --
SELECT title, COALESCE(salary::TEXT, 'Not disclosed') AS salary FROM roles;

-- 68. Return each student's email, falling back to 'no email on file' --
SELECT COALESCE(email, 'no email on file') AS email FROM students;

-- 69. Return each application's response_date, falling back to its applied_date if the response date is missing --
SELECT COALESCE(response_date, applied_date) AS response_date FROM applications;

-- 70. Return every student's first name and their mentor_id, showing 'No mentor assigned' where there isn't one --
SELECT first_name, COALESCE(mentor_id::TEXT, 'No mentor assigned') AS mentor_id FROM students;

-- 71. Return interview scores, showing 'Not yet scored' where NULL --
SELECT COALESCE(score::TEXT, 'Not yet scored') AS score FROM interviews;

-- 72. Return each role's salary and a column that shows NULL whenever the salary is exactly 28500 --
SELECT salary, NULLIF(salary, 28500) FROM roles; 

-- 73. Count how many roles have a NULL salary. Then count how many have a non-NULL salary. Confirm the two numbers add up to the total row count --
SELECT COUNT(*) AS total_rows,
    COUNT(salary) AS with_salary,
    COUNT(*) - COUNT(salary) AS without_salary
FROM roles;

-- 74. Explain why WHERE salary != 32000 doesn't return roles with a NULL salary, and write a version that does include them --
-- If salary was NULL, NULL != 32000 returns NULL, which is not true or false so it's not included.
SELECT salary FROM roles WHERE salary != 32000 OR salary IS NULL;
