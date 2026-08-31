-- 7. Insert new company: Vintage AI, AI sector, Cambridge, 45 staff, founded 2023-05-04 --
INSERT INTO companies
VALUES (
    9, 
    'Vantage AI',
    'AI',
    'Cambridge',
    45,
    '2023-05-04'
);

-- 8. Insert 2 roles for Vantage AI: an "ML Engineer Placement" at £33,000 in Cambridge (posted today, closes in 60 days), and a "Research Intern" with an unknown salary, remote. --
INSERT INTO roles (
    role_id, 
    company_id, 
    title, 
    salary, 
    location, 
    posted_date, 
    closing_date, 
    is_remote
) 
VALUES (
    16,
    9,
    'ML Engineer Placement',
    33000,
    'Cambridge',
    CURRENT_DATE,
    CURRENT_DATE + 60,
    0
);

INSERT INTO roles (
    role_id, 
    company_id, 
    title, 
    salary, 
    location, 
    posted_date, 
    closing_date, 
    is_remote
) 
VALUES (
    17,
    9,
    'Research Intern',
    NULL,
    'Cambridge',
    CURRENT_DATE,
    CURRENT_DATE + 45,
    1
);

-- 9. Insert yourself as student 15 --
INSERT INTO students (
    student_id,
    first_name,
    last_name,
    email,
    university,
    course,
    grad_year
)
VALUES (
    15,
    'Jamil',
    'Hassiba',
    'jamil.hassiba@uni.ac.uk',
    'University of Manchester',
    'Computer Science',
    2029
);

-- 10. Insert an application to the ML Engineer Placement today, status 'submitted', no response yet --
INSERT INTO applications (
    application_id,
    student_id,
    role_id,
    applied_date,
    status
)
VALUES (
    33,
    15,
    16,
    CURRENT_DATE,
    'submitted'
);

-- 11. Every application with status 'submitted' that was applied for before 2026-02-01 has gone stale. Update those to 'rejected' and set their response_date to 2026-03-31 --
UPDATE applications
SET status = 'rejected',
    response_date = '2026-03-31'
WHERE status = 'submitted' 
  AND applied_date < '2026-02-01';

-- 12. Pixelforge has rebranded to "Pixelforge Studios". Update it --
UPDATE companies
SET company_name = 'Pixelforge Studios'
WHERE company_id = 2;

-- 13. Roles with no closing_date are causing bugs. Set every NULL closing_date to 90 days after that role's posted_date --
UPDATE roles
SET closing_date = posted_date + 90
WHERE closing_date IS NULL;

-- 14. Delete all applications with status 'withdrawn' --
DELETE FROM applications
WHERE status = 'withdrawn';

-- 15. Two students never signed up properly (13 and 14 have no applications). Delete student 14 only. --
DELETE FROM students
WHERE student_id = 14;
