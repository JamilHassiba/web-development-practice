-- 83. How many students are there? How many applications? --
SELECT COUNT(*) AS students_count FROM students;
SELECT COUNT(*) AS applications_count FROM applications;

-- 84. How many students have an email address on file? Note how COUNT(column) differs from COUNT(*) --
SELECT COUNT(email) AS students_with_email FROM students;

-- 85. What's the average, minimum, maximum, and total salary across all roles? --
SELECT 
    ROUND(AVG(salary), 2) AS average, 
    MIN(salary), MAX(salary), 
    SUM(salary) AS total 
FROM roles;

-- 86. What's the average salary per company? Show the company_id and the average --
SELECT company_id, ROUND(AVG(salary)) AS average FROM roles GROUP BY company_id;

-- 87. How many roles does each company have? Include the company_id --
SELECT company_id, COUNT(*) AS role_count FROM roles GROUP BY company_id;

-- 88. How many applications does each student have? Show student_id and the count, ordered from most to least --
SELECT 
    student_id, 
    COUNT(*) AS applications_count 
FROM applications 
GROUP BY student_id
ORDER BY COUNT(*) DESC;

-- 89. Average interview score per application, ignoring unscored interviews --
SELECT 
    application_id,
    ROUND(AVG(score), 2) AS average_score 
FROM interviews 
WHERE score IS NOT NULL
GROUP BY application_id;

-- 90. Which statuses appear in applications, and how many of each? --
SELECT status, COUNT(*) FROM applications GROUP BY status;

-- 91. Count applications per month of applied_date, ordered chronologically --
SELECT 
    TO_CHAR(DATE_TRUNC('month', applied_date), 'FMMonth YYYY') AS applied_date, 
    COUNT(*) 
FROM applications 
GROUP BY DATE_TRUNC('month', applied_date)
ORDER BY DATE_TRUNC('month', applied_date) ASC;

-- 92. Average salary per city, but only for cities with more than 2 roles --
SELECT 
    location, 
    ROUND(AVG(salary), 2) AS average_salary 
FROM roles 
GROUP BY location 
HAVING COUNT(*) > 2;

-- 93. Companies with an average salary above £29,000 --
SELECT 
    company_id, 
    ROUND(AVG(salary), 2) AS average_salary 
FROM roles 
WHERE salary IS NOT NULL
GROUP BY company_id 
HAVING AVG(salary) > 29000;

-- 94. The highest interview score per interviewer (clean the casing first) --
SELECT
    INITCAP(interviewer_name) AS interviewer,
    MAX(score) AS highest_score
FROM interviews
GROUP BY INITCAP(interviewer_name);

-- 95. For each role, the number of applications it received and the number that reached 'offer'. (CASE inside SUM.) --
SELECT 
    role_id,
    COUNT(*) AS applications_number,
    SUM(CASE WHEN status = 'offer' THEN 1 ELSE 0 END)
FROM applications
GROUP BY role_id;

-- 96. Total number of interview rounds conducted per application, and the maximum round reached --
SELECT
    application_id,
    COUNT(*) AS total_rounds,
    MAX(round_number) AS max_round_number
FROM interviews
GROUP BY application_id;
