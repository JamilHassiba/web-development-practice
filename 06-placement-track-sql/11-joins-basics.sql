-- 97. List every application with the student's full name and the role title --
SELECT
    a.application_id,
    CONCAT(TRIM(s.first_name), ' ', TRIM(s.last_name)) AS student_name,
    r.title,
    a.applied_date,
    a.status,
    a.response_date
FROM applications AS a
LEFT JOIN students AS s
    ON a.student_id = s.student_id
LEFT JOIN roles AS r
    ON a.role_id = r.role_id;

-- 98. List every role with its company name --
SELECT
    r.role_id,
    c.company_name,
    r.title,
    r.salary,
    r.location,
    r.posted_date,
    r.closing_date,
    r.is_remote
FROM roles AS r
LEFT JOIN companies AS c
    ON r.company_id = c.company_id;

-- 99. List every application with student name, role title, and company name --
SELECT
    a.application_id,
    CONCAT(TRIM(s.first_name), ' ', TRIM(s.last_name)) AS student_name,
    r.title,
    c.company_name
FROM applications AS a
LEFT JOIN students AS s
    ON a.student_id = s.student_id
LEFT JOIN roles AS r
    ON a.role_id = r.role_id
LEFT JOIN companies AS c
    ON r.company_id = c.company_id;

-- 100. List every company and its roles, **including companies with no roles** --
SELECT
    c.company_name,
    r.title
FROM companies AS c
LEFT JOIN roles AS r
    ON c.company_id = r.company_id;

-- 101. List every student and their applications, **including students who never applied** --
SELECT
    CONCAT(TRIM(s.first_name), ' ', TRIM(s.last_name)) AS student_name,
    a.application_id
FROM students AS s
LEFT JOIN applications AS a
    ON s.student_id = a.student_id;

-- 102. List every role and the count of applications it received, including roles with zero applications --
SELECT
    r.title,
    COUNT(a.application_id) AS applications_count
FROM roles AS r
LEFT JOIN applications AS a
    ON r.role_id = a.role_id
GROUP BY r.role_id;

-- 103. List every interview with the student's name and the company they interviewed at --
SELECT
    i.interview_id,
    CONCAT(TRIM(s.first_name), ' ', TRIM(s.last_name)) AS student_name,
    c.company_name,
    i.round_number,
    i.interview_date,
    i.score,
    i.interviewer_name
FROM interviews AS i
LEFT JOIN applications AS a 
    ON i.application_id = a.application_id
LEFT JOIN students AS s
    ON a.student_id = s.student_id
LEFT JOIN roles AS r 
    ON a.role_id = r.role_id
LEFT JOIN companies AS c
    on r.company_id = c.company_id;

-- 104. Show every student alongside every London role --
SELECT
    CONCAT(TRIM(s.first_name), ' ', TRIM(s.last_name)) AS student_name,
    r.*
FROM roles AS r
CROSS JOIN students AS s
WHERE r.location = 'London';

-- 105. Show every application alongside the interviews for it, including applications with no interviews --
SELECT
    a.application_id,
    a.student_id,
    a.applied_date,
    a.status,
    a.response_date,
    i.round_number,
    i.interview_date,
    i.score,
    i.interviewer_name
FROM applications AS a
LEFT JOIN interviews AS i
    ON a.application_id = i.application_id;
