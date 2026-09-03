-- 75. Label each role's salary band: 'Low' under £25,000, 'Mid' £25,000–£32,000, 'High' above £32,000, 'Unknown' if NULL.
SELECT *,
    CASE
        WHEN salary < 25000 THEN 'Low'
        WHEN salary <= 32000 THEN 'Mid'
        WHEN salary > 32000 THEN 'High'
        ELSE 'Unknown'
    END AS salary_band
FROM roles;

-- 76. Label each company by size: 'Startup' under 100, 'Scale-up' 100–999, 'Enterprise' 1,000+.
SELECT *,
    CASE
        WHEN headcount < 100 THEN 'Startup'
        WHEN headcount <= 999 THEN 'Scale-up'
        ELSE 'Enterprise'
    END AS company_size
FROM companies;

-- 77. Add a column to applications showing 'Successful' for offers, 'In progress' for submitted/screening/interview, and 'Unsuccessful' for rejected/withdrawn.
SELECT *,
    CASE
        WHEN status = 'offer' THEN 'Successful'
        WHEN status IN ('submitted', 'screening', 'interview') THEN 'In progress'
        WHEN status IN ('rejected', 'withdrawn') THEN 'Unsuccessful'
    END AS status
FROM applications;

-- 78. Label each role 'Remote' or 'On-site' based on is_remote.
SELECT *,
    CASE is_remote
        WHEN 1 THEN 'Remote'
        WHEN 0 THEN 'On-site'
    END AS type
FROM roles;

-- 79. Label each student by graduation urgency: 'Graduating soon' for 2026, 'Next year' for 2027, 'Plenty of time' for anything later.
SELECT *,
    CASE grad_year
        WHEN 2026 THEN 'Graduating soon'
        WHEN 2027 THEN 'Next year'
        ELSE 'Plenty of time'
    END AS grad_urgency
FROM students;

-- 80. For each interview, label the score 'Strong' (80+), 'Pass' (65–79), 'Weak' (below 65), 'Pending' (NULL).
SELECT *,
    CASE 
        WHEN score >= 80 THEN 'Strong'
        WHEN score >= 65 THEN 'Pass'
        WHEN score < 65 THEN 'Weak'
        ELSE 'Pending'
    END AS score_label
FROM interviews;

-- 81. Return a single row: count of applications that resulted in an offer, and count that didn't — as two columns, using CASE inside aggregate functions.
SELECT
    COUNT(*) AS total,
    COUNT(CASE WHEN status = 'offer' THEN 1 END) AS got_offer,
    COUNT(CASE WHEN status != 'offer' THEN 0 END) AS no_offer
FROM applications;

-- 82. Order roles so that London roles appear first, then Remote, then everything else — using CASE in the ORDER BY.
SELECT *
FROM roles
ORDER BY
    CASE
        WHEN location = 'London' THEN 1
        WHEN location = 'Remote' THEN 2
        ELSE 3
    END ASC,
    location ASC
