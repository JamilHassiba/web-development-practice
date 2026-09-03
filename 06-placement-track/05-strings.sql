-- 36. Return each student's full name as a single column called `full_name` ("Amira Haddad") --
SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM students;

-- 37. Notice that student 2's first and last names have stray whitespace. Return all students with names trimmed --
SELECT CONCAT(TRIM(first_name), ' ', TRIM(last_name)) AS full_name FROM students;

-- 38. Return every student email in lowercase --
SELECT LOWER(email) AS email FROM students;

-- 39. Return each student's initials, e.g. "A.H." for Amira Haddad --
SELECT CONCAT(LEFT(TRIM(first_name), 1), '.', LEFT(TRIM(last_name), 1), '.') AS initials FROM students;

-- 40. Return the university name in uppercase along with its character length --
SELECT DISTINCT UPPER(university) AS university, LENGTH(university) FROM students;

-- 41. Extract the domain part of each email (everything after the `@`) --
SELECT SPLIT_PART(email, '@', 2) AS domain FROM students;

-- 42. Return each role's title with the word "Placement" replaced by "Placement Year" --
SELECT REPLACE(title, 'Placement', 'Placement Year') AS title FROM roles;

-- 43. Return the first 3 characters of every company name --
SELECT LEFT(company_name, 3) AS name_3 FROM companies;

-- 44. Find all students whose last name starts with "M" --
SELECT * FROM students WHERE last_name LIKE 'M%';

-- 45. Find all roles whose title contains the word "Engineer" --
SELECT * FROM roles WHERE title LIKE '%Engineer%';

-- 46. Build a display string for each role: `"Software Engineer Placement — London (£32000)"`. Handle roles with a NULL salary gracefully (they should still appear, with something sensible where the number goes) --
SELECT CONCAT(title, ' — ', location, ' ', COALESCE('(£' || salary || ')', '(Unknown)')) AS summary FROM roles;

-- 47. The `interviewer_name` column has inconsistent casing ("r. castillo", "R. CASTILLO"). Return a cleaned, consistently-cased list of distinct interviewer names --
SELECT DISTINCT INITCAP(interviewer_name) AS interviewer_name FROM interviews;
