-- 23. All roles based in London --
SELECT * FROM roles WHERE location = 'London';

-- 24. All roles paying more than £28,000 --
SELECT * FROM roles WHERE salary > 28000;

-- 25. All roles paying between £25,000 and £32,000 inclusive --
SELECT * FROM roles WHERE salary BETWEEN 25000 AND 32000;

-- 26. All roles in London *or* Manchester, using an operator that isn't `OR` --
SELECT * FROM roles WHERE location IN ('London', 'Manchester');

-- 27. All applications with status 'offer' or 'interview' --
SELECT * FROM applications WHERE status in ('offer', 'interview');

-- 28. All roles that are remote **and** pay more than £28,000 --
SELECT * FROM roles WHERE is_remote = 1 AND salary > 28000;

-- 29. All roles that are *not* in London --
SELECT * FROM roles WHERE NOT location = 'London';

-- 30. All roles with an unknown salary --
SELECT * FROM roles WHERE salary IS NULL;

-- 31. All roles with a known salary and a known closing date --
SELECT * FROM roles WHERE salary IS NOT NULL AND closing_date IS NOT NULL;

-- 32. All students graduating in 2026 or 2027 who study Computer Science --
SELECT * FROM students WHERE grad_year in (2026, 2027) AND course = 'Computer Science';

-- 33. All applications submitted in February 2026 (use a date range, not a function) --
SELECT * FROM applications WHERE applied_date >= '2026-02-01' AND applied_date < '2026-03-01';

-- 34. The 3 lowest-paying roles that have a known salary --
SELECT * FROM roles ORDER BY salary ASC NULLS LAST LIMIT 3;

-- 35. All companies founded before 2010 with more than 1,000 staff --
SELECT * FROM companies WHERE founded_date < '2010-01-01' AND headcount > 1000;
