-- 106. Return each student's name alongside their mentor's name. Include students with no mentor --
SELECT 
    CONCAT(TRIM(s.first_name), ' ', TRIM(s.last_name)) AS student_name,
    TRIM(m.first_name) || ' ' || TRIM(m.last_name) AS mentor_name
FROM students AS s
LEFT JOIN students AS m
    ON s.mentor_id = m.student_id;

-- 107. Find all students who have **never** applied to anything  --
SELECT
    CONCAT(TRIM(s.first_name), ' ', TRIM(s.last_name)) AS student_name
FROM students AS s
LEFT JOIN applications AS a
    ON s.student_id = a.student_id
WHERE a.student_id IS NULL;

-- 108. Find all companies that have posted roles but received **zero** applications across all of them --
SELECT c.company_id, c.company_name
FROM companies AS c
INNER JOIN roles AS r
    ON c.company_id = r.company_id
LEFT JOIN applications AS a
    ON r.role_id = a.role_id
GROUP BY c.company_id, c.company_name
HAVING COUNT(a.application_id) = 0;

-- 109. Find all roles that nobody has interviewed for --
SELECT r.role_id, r.title
FROM roles AS r
INNER JOIN applications AS a
    ON r.role_id = a.role_id
LEFT JOIN interviews AS i
    ON a.application_id = i.application_id
GROUP BY r.role_id, r.title
HAVING COUNT(i.interview_id) = 0;

-- 110. Find every mentor who has at least one mentee, along with how many mentees they have --
SELECT
    m.student_id,
    TRIM(m.first_name) || ' ' || TRIM(m.last_name) AS mentor_name,
    COUNT(s.*) AS mentee_count
FROM students AS s
INNER JOIN students AS m
    ON s.mentor_id = m.student_id
GROUP BY m.student_id, mentor_name;

-- 111. Find pairs of students who study at the same university --
SELECT s.student_id, s.first_name, p.student_id, p.first_name, s.university
FROM students AS s
CROSS JOIN students AS p
WHERE s.student_id < p.student_id
    AND s.university = p.university;

-- 112. Find pairs of roles at the same company with the same salary --
SELECT r.role_id, r.title, p.role_id, p.title, r.company_id, r.salary
FROM roles AS r
CROSS JOIN roles AS p
WHERE r.role_id < p.role_id
    AND r.company_id = p.company_id
    AND r.salary = p.salary;

-- 113. Show every student and every application, with unmatched rows from both sides --
SELECT s.student_id, s.first_name, a.application_id, a.applied_date,  a.status, a.response_date
FROM students AS s
FULL JOIN applications AS a
    ON s.student_id = a.student_id
WHERE s.student_id IS NULL
    OR a.student_id IS NULL;

-- 114. For each student, show their name, the number of applications, the number of interviews they've attended, and their best interview score. Include students with no applications at all --
SELECT
    s.student_id,
    TRIM(s.first_name) AS first_name,
    COUNT(DISTINCT a.application_id) AS applications_count,
    COUNT(i.interview_id) AS interviews_attended,
    MAX(i.score) AS best_score
FROM students AS s
LEFT JOIN applications AS a
    ON s.student_id = a.student_id
LEFT JOIN interviews AS i
    ON a.application_id = i.application_id
GROUP BY s.student_id, s.first_name;

-- 115. Show every company alongside every sector's average headcount --
SELECT
    c.company_id,
    c.company_name,
    p.sector,
    ROUND(AVG(p.headcount)) AS average_headcount
FROM companies AS c
CROSS JOIN companies AS p
GROUP BY c.company_id, c.company_name, p.sector;
